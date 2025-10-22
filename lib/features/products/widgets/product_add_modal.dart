import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_dropdown.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/cart/models/get_all_units_response.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/cart/pages/screens/components/select_unit_bottomsheet.dart';
import 'package:bozorlik/features/home/models/marketability.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/models/unit_model.dart';
import 'package:bozorlik/features/products/notifiers/units_notifier.dart';
import 'package:bozorlik/features/products/widgets/select_market_bottomsheet.dart';
import 'package:bozorlik/utils/textfield_summ_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toastification/toastification.dart';

class ProductAddModal extends HookConsumerWidget {
  const ProductAddModal({super.key, required this.model});

  final ProductModel? model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    nameController.text = model?.titleUz ?? "";
    final amountController = useTextEditingController();
    final units = ref.watch(unitsNotifierProvider);
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameFocusNode = useFocusNode();
    final amountFocusNode = useFocusNode();
    final unit = useState<UnitModel?>(null);
    final unitNotifier = ref.watch(unitsNotifierProvider.notifier);

    // BU YERDA O'ZGARTIRISH: useState ishlatamiz
    final selectMarketName = useState<String?>(null);
    final selectMarketId = useState<String?>(null);

    useEffect(() {
      if (model == null) {
        nameFocusNode.requestFocus();
      } else {
        amountFocusNode.requestFocus();
      }
      return null;
    }, [0]);

    return Container(
      decoration: BoxDecoration(color: CupertinoColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("new_add_product".tr(), style: Theme.of(context).textTheme.titleMedium),
                10.vertical,

                CustomTextField(
                  isDeletable: true,
                  labelText: "product_name".tr(),
                  focusNode: nameFocusNode,
                  controller: nameController,
                  hintText: "product_name_example".tr(),
                ),
                10.vertical,
                10.vertical,
                Text("select_market".tr(), style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
                8.vertical,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ShowMarketBottomsheet(id: selectMarketId.value);
                          },
                        ).then((v) {
                          if (v != null) {
                            MarketabilityResponseData data = v;
                            selectMarketName.value = data.name;
                            selectMarketId.value = data.id;
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 2, color: CupertinoColors.systemGroupedBackground),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectMarketName.value ?? "select_market".tr(), style: TextStyle(fontSize: 16, color: Colors.black87)),
                            Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                10.vertical,

                Container(
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.grey)),

                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Expanded(
                          flex: 2,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              NumberFormatter(),
                            ],
                            controller: amountController,
                            decoration: InputDecoration(

                              hintText: "amount_example".tr(),
                              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
                            ),
                          ),
                        ),
                        // CustomTextField(
                        //   focusNode: amountFocusNode,
                        //   labelText: "amount".tr(),
                        //   validatorText: "required_field".tr(),
                        //   hintText: "amount_example".tr(),
                        //   textInputType: TextInputType.numberWithOptions(),
                        //   controller: amountController,
                        // ),
                      ),
                      8.horizontal,
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalBottomSheet(context: context, builder: (context) => SelectUnitBottomsheet(id: unit.value?.id)).then((v) {
                            GetAllUnitResponseData data = v;
                            unit.value = unitNotifier.findUnitByName(name: data.nameUz!, units: units.valueOrNull ?? []);
                          
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
                              Text("${unit.value?.name ?? ""} narxi", style: TextStyle(color: Colors.black87, fontSize: 15)),
                              SizedBox(width: 8),
                              Icon(Icons.keyboard_arrow_down, color: Colors.black87, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                10.vertical,
                CustomTextField(isDeletable: true, labelText: "description".tr(), controller: descriptionController, hintText: "..."),
                20.vertical,
                CustomButton(
                  isLoading: isLoading.value,
                  text: "add_to_cart".tr(),
                  onTap: () async {
                    if (nameController.text.isEmpty) {
                      showCustomToast(title: "Empty field", type: ToastificationType.error);
                      return;
                    }
                    if (!formKey.currentState!.validate()) return;

                    isLoading.value = true;

                    print("---------------------");
                    print("${model?.id.toString()}");
                    print("${descriptionController.text}");
                    print("${nameController.text}");
                    print("${double.tryParse(amountController.text)}");
                    print("${unit.value?.id}");
                    print("${selectMarketId.value}");
                    print("---------------------");
                    try {
                      var response = await ref
                          .read(cartNotifierProvider.notifier)
                          .addProductToCart(
                            productId: model?.id??"",
                            description: descriptionController.text,
                            name: nameController.text,
                            amount: double.tryParse(getUnformattedValue(amountController.text)) ?? 0,
                            unitId: unit.value?.id ?? "",
                            marketId: selectMarketId.value ?? "",
                          );

                      isLoading.value = false;
                      if (context.mounted) {
                        showCustomToast(title: "success_sent".tr(), type: ToastificationType.success);
                        Navigator.pop(context);
                      }
                    } catch (e, s) {
                      showCustomToast(title: e.toString(), type: ToastificationType.error);
                      Navigator.pop(context);
                    }
                  },
                ),
                30.vertical,
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future show(BuildContext context, {required ProductModel? model}) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => ProductAddModal(model: model),
    );
  }
}
