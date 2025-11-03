import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/models/get_all_units_response.dart' hide MarketLists;
import 'package:bozorlik/features/cart/pages/screens/components/select_unit_bottomsheet.dart';
import 'package:bozorlik/features/cart/pages/screens/components/select_unit_one_bottomsheet.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/textfield_summ_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toastification/toastification.dart';

class BuyProductBottomsheet extends StatefulWidget {
  const BuyProductBottomsheet({super.key, required this.product, required this.save, required this.marketListId});

  final MarketLists? product;
  final String? marketListId;
  final Function(double price, Unit unit,String selectUnit) save;

  @override
  State<BuyProductBottomsheet> createState() => _BuyProductBottomsheetState();
}

class _BuyProductBottomsheetState extends State<BuyProductBottomsheet> {
  String? unitId;
  String? unitName;

  final TextEditingController controller = TextEditingController();
  final bloc = InnerCartBloc();

  @override
  void initState() {
    super.initState();

    unitName = widget.product?.unit?.name ?? "";
    unitId = widget.product?.unit?.id ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<InnerCartBloc, InnerCartState>(
          listener: (context, state) {
            if (state.statusCheck == Status.error) {
              showCustomToast(title: state.errorMessageCheck ?? "", type: ToastificationType.error);
            }

            if (state.statusCheck == Status.success) {
              print("---------UnitName");
              print(unitName);
              final currentLocale = context.locale.languageCode;

              // Tilga qarab title-ni tanlash
              String getTitle() {
                switch (currentLocale) {
                  case 'uz':
                    return "Jami";
                  case 'ky':
                    return "Жами";
                  case 'ru':
                    return "Итого";
                  case 'en':
                    return "Total";
                  default:
                    return "Jami";
                }
              }
              widget.save(double.parse(getUnformattedValue(controller.text ?? "")), Unit(id: unitId, name: unitName),
                  unitName == getTitle() ? "all" : "one");
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom + 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 4, width: 36, decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8))),
                        ],
                      ),
                    ),
                    Text(
                      widget.product?.productName ?? "",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    12.vertical,
                    Text("product_price".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
                    12.vertical,

                    Container(
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly, NumberFormatter()],
                              decoration: InputDecoration(
                                hintText: "write_summ".tr(),
                                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => SelectUnitOneBottomsheet(unitId: unitId, unitName: unitName),
                              ).then((v) {
                                if (v != null) {
                                  Unit data = v;

                                  unitId = data.id;
                                  unitName = data.name;
                                  setState(() {});
                                }
                              });
                            },

                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("${unitName ?? ""} ${"price_small".tr()}", style: TextStyle(color: Colors.black87, fontSize: 15)),
                                  SizedBox(width: 8),
                                  Icon(Icons.keyboard_arrow_down, color: Colors.black87, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.vertical,
                    CustomButton(
                      isLoading: state.statusCheck == Status.loading,
                      text: "confirmation".tr(),
                      onTap: () {
                        if (controller.text.isNotEmpty && unitId != null) {

                          final currentLocale = context.locale.languageCode;

                          // Tilga qarab title-ni tanlash
                          String getTitle() {
                            switch (currentLocale) {
                              case 'uz':
                                return "Jami";
                              case 'ky':
                                return "Жами";
                              case 'ru':
                                return "Итого";
                              case 'en':
                                return "Total";
                              default:
                                return "Jami";
                            }
                          }
                          bloc.add(
                            MarketListCheckEvent(
                              id: widget.marketListId.toString(),
                              price: num.parse(getUnformattedValue(controller.text)),
                              calculationType: unitName == getTitle() ? "all" : "one",
                            ),
                          );
                        } else {
                          showCustomToast(title: "Required fields", type: ToastificationType.error);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
