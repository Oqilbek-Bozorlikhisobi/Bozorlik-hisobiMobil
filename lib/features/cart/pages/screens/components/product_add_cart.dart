import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/common/widgets/custom_toast.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:bozorlik/features/cart/models/get_all_units_response.dart'
    hide MarketLists;
import 'package:bozorlik/features/cart/pages/screens/components/select_unit_bottomsheet.dart';
import 'package:bozorlik/features/categories/models/brends_response.dart';
import 'package:bozorlik/features/categories/pages/categories_page.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/textfield_summ_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:toastification/toastification.dart';

import '../../../models/cart_response.dart';

//
// class ProductAddLocalModal extends HookConsumerWidget {
//   // final ProductModel? model;
//   final String marketName;
//   final String marketId;
//
//   ProductAddLocalModal({required this.marketName, required this.marketId});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final nameController = useTextEditingController();
//     final descriptionController = useTextEditingController();
//     final amountController = useTextEditingController();
//     final units = ref.watch(unitsNotifierProvider);
//     final isLoading = useState(false);
//     final formKey = useMemoized(() => GlobalKey<FormState>());
//     final nameFocusNode = useFocusNode();
//     final unit = useState<UnitModel?>(null);
//     final unitNotifier = ref.watch(unitsNotifierProvider.notifier);
//
//     final selectMarketName = useState<String?>(marketName);
//     final selectMarketId = useState<String?>(marketId);
//
//     selectMarketName.value = marketName;
//     selectMarketId.value = marketId;
//
//     return Container(
//       decoration: BoxDecoration(color: CupertinoColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//       padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Form(
//         key: formKey,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text("new_add_product".tr(), style: Theme.of(context).textTheme.titleMedium),
//                 10.vertical,
//
//                 CustomTextField(
//                   isDeletable: true,
//                   labelText: "product_name".tr(),
//                   focusNode: nameFocusNode,
//                   controller: nameController,
//                   hintText: "product_name_example".tr(),
//                 ),
//                 10.vertical,
//                 10.vertical,
//                 Text("select_market".tr(), style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
//                 8.vertical,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // showCupertinoModalBottomSheet(
//                         //   context: context,
//                         //   builder: (context) {
//                         //     return ShowMarketBottomsheet(id: selectMarketId.value);
//                         //   },
//                         // ).then((v) {
//                         //   if (v != null) {
//                         //     MarketabilityResponseData data = v;
//                         //     // BU YERDA O'ZGARTIRISH: .value orqali o'zgartiramiz
//                         //     selectMarketName.value = data.name;
//                         //     selectMarketId.value = data.id;
//                         //   }
//                         // });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                         decoration: BoxDecoration(
//                           color: AppColors.white,
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(width: 2, color: CupertinoColors.systemGroupedBackground),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // BU YERDA O'ZGARTIRISH: .value orqali o'qiymiz
//                             Text(selectMarketName.value ?? "select_market".tr(), style: TextStyle(fontSize: 16, color: Colors.black87)),
//                             Icon(Icons.keyboard_arrow_down, color: Colors.grey),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 10.vertical,
//
//                 Container(
//                   width: double.infinity,
//                   height: 44,
//                   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.grey)),
//
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Expanded(
//                           flex: 2,
//                           child: TextField(
//                             controller: amountController,
//                             decoration: InputDecoration(
//                               hintText: "amount_example".tr(),
//                               hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.only(left: 16, top: 11, bottom: 11),
//                             ),
//                           ),
//                         ),
//                       ),
//                       8.horizontal,
//                       GestureDetector(
//                         onTap: () {
//                           showCupertinoModalBottomSheet(context: context, builder: (context) => SelectUnitBottomsheet(id: unit.value?.id)).then((v) {
//                             GetAllUnitResponseData data = v;
//                             unit.value = unitNotifier.findUnitByName(name: data.nameUz!, units: units.valueOrNull ?? []);
//                           });
//                         },
//
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
//                           decoration: BoxDecoration(
//                             color: AppColors.grey,
//                             borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text("${unit.value?.name ?? ""} narxi", style: TextStyle(color: Colors.black87, fontSize: 15)),
//                               SizedBox(width: 8),
//                               Icon(Icons.keyboard_arrow_down, color: Colors.black87, size: 20),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 10.vertical,
//                 CustomTextField(isDeletable: true, labelText: "description".tr(), controller: descriptionController, hintText: "..."),
//                 20.vertical,
//                 CustomButton(
//                   isLoading: isLoading.value,
//                   text: "add_to_cart".tr(),
//                   onTap: () async {
//                     if (nameController.text.isEmpty) {
//                       showCustomToast(title: "Empty field", type: ToastificationType.error);
//                       return;
//                     }
//                     if (!formKey.currentState!.validate()) return;
//
//                     isLoading.value = true;
//                     try {
//                       // var response = await ref
//                       //     .read(cartNotifierProvider.notifier)
//                       //     .addProductToCart(
//                       //   product: model,
//                       //   description: descriptionController.text,
//                       //   name: nameController.text,
//                       //   amount: double.tryParse(amountController.text) ?? 0,
//                       //   unitId: unit.value?.id ?? "",
//                       //   marketId: selectMarketId.value ?? "",
//                       // );
//                       //
//                       // isLoading.value = false;
//                       // if (context.mounted) {
//                       //   showCustomToast(title: "success_sent".tr(), type: ToastificationType.success);
//                       //   Navigator.pop(context);
//                       // }
//                     } catch (e, s) {
//                       showCustomToast(title: e.toString(), type: ToastificationType.error);
//                       Navigator.pop(context);
//                     }
//                   },
//                 ),
//                 30.vertical,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Future show(BuildContext context, final String marketName, final String marketId) async {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (context) => ProductAddLocalModal(marketName: marketName, marketId: marketId),
//     );
//   }
// }
///--------------------------------------------------------------------
class ProductAddCartLocaleBottomsheet extends StatefulWidget {
  const ProductAddCartLocaleBottomsheet({
    super.key,
    required this.marketName,
    required this.marketId,
  });

  final String marketName;
  final String marketId;

  @override
  State<ProductAddCartLocaleBottomsheet> createState() =>
      _ProductAddCartLocaleBottomsheetState();
}

class _ProductAddCartLocaleBottomsheetState
    extends State<ProductAddCartLocaleBottomsheet> {
  final bloc = InnerCartBloc();
  int _selectedIndex = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String? unitId;
  String? selectProductId;
  String? unitName;
  GetAllUnitResponseData? data;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String? _validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill all required field".tr();
    }

    return null;
  }

  String? _validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill all required field".tr();
    }

    return null;
  }

  String? _validateUnit(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill all required field".tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<InnerCartBloc, InnerCartState>(
          listener: (context, state) {
            if (state.statusAddProduct == Status.success) {
              context.pop(
                state.addNewProduct,
                // MarketLists(
                //   productName: nameController.text,
                //   quantity: double.parse(amountController.text ?? ""),
                //   description: descriptionController.text,
                //   unit: Unit(id: data?.id ?? "", createdAt: data?.createdAt, updatedAt: data?.updatedAt, name: data?.nameUz),
                // ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 12,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "new_add_product".tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        10.vertical,
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 6,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = 0;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            _selectedIndex == 0
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'handwriting'.tr(),
                                          style: TextStyle(
                                            color:
                                                _selectedIndex == 0
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = 1;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            _selectedIndex == 1
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'choose_brends'.tr(),
                                          style: TextStyle(
                                            color:
                                                _selectedIndex == 1
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        10.vertical,

                        Builder(
                          builder: (context) {
                            if (_selectedIndex == 0) {
                              return CustomTextField(
                                isDeletable: true,
                                validator: _validateProductName,
                                labelText: "product_name".tr(),
                                controller: nameController,
                                hintText: "product_name_example".tr(),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "product_name".tr(),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  8.vertical,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showCupertinoModalBottomSheet(
                                            context: context,
                                            builder:
                                                (context) => CategoriesPage(
                                                  isCart: true,
                                                ),
                                          ).then((v) {
                                            if (v != null) {
                                              BrendsResponseDataItemsProducts
                                              data = v;
                                              final currentLocale =
                                                  context.locale.languageCode;

                                              // Tilga qarab title-ni tanlash
                                              String getTitle() {
                                                switch (currentLocale) {
                                                  case 'uz':
                                                    return data.titleUz ?? "";
                                                  case 'ky':
                                                    return data.titleUzk ?? "";
                                                  case 'ru':
                                                    return data.titleRu ?? "";
                                                  case 'en':
                                                    return data.titleEn ?? "";
                                                  default:
                                                    return data.titleUz ?? "";
                                                }
                                              }

                                              nameController.text = getTitle();
                                              selectProductId = data.id ?? "";
                                              setState(() {});
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              width: 2,
                                              color:
                                                  CupertinoColors
                                                      .systemGroupedBackground,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                nameController.text.isEmpty
                                                    ? "Dena"
                                                    : nameController.text,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: AppColors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                          },
                        ),

                        // 20.vertical,
                        // Text(
                        //   "select_market".tr(),
                        //   style: Theme.of(
                        //     context,
                        //   ).textTheme.bodyMedium?.copyWith(
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 14,
                        //   ),
                        // ),
                        // 8.vertical,
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     GestureDetector(
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //           horizontal: 8,
                        //           vertical: 10,
                        //         ),
                        //         decoration: BoxDecoration(
                        //           color: AppColors.white,
                        //           borderRadius: BorderRadius.circular(12),
                        //           border: Border.all(
                        //             width: 2,
                        //             color:
                        //                 CupertinoColors.systemGroupedBackground,
                        //           ),
                        //         ),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               widget.marketName ?? "select_market".tr(),
                        //               style: TextStyle(
                        //                 fontSize: 16,
                        //                 color: Colors.grey,
                        //               ),
                        //             ),
                        //             Icon(
                        //               Icons.keyboard_arrow_down,
                        //               color: Colors.grey,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        20.vertical,
                        Text(
                          "product_count_summ".tr(),
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        8.vertical,

                        Container(
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.grey),
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    validator: _validateAmount,
                                    onChanged: (v) {
                                      setState(() {});
                                    },

                                    controller: amountController,
                                    decoration: InputDecoration(
                                      hintText: "amount_example".tr(),
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 15,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                        left: 16,
                                        top: 11,
                                        bottom: 11,
                                      ),
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      NumberFormatter(),
                                    ],
                                  ),
                                ),
                              ),
                              8.horizontal,
                              GestureDetector(
                                onTap: () {
                                  showCupertinoModalBottomSheet(
                                    context: context,
                                    builder:
                                        (context) =>
                                            SelectUnitBottomsheet(id: unitId),
                                  ).then((v) {
                                    data = v;
                                    unitName = data?.nameUz ?? "";
                                    unitId = data?.id ?? "";
                                    setState(() {});
                                  });
                                },

                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 11,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${unitName ?? "${"quantity".tr()}"} ",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black87,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (unitId == null || unitId!.isEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Please fill all required field".tr(),
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        10.vertical,
                        CustomTextField(
                          isDeletable: true,
                          labelText: "description".tr(),
                          controller: descriptionController,
                          hintText: "...",
                        ),
                        20.vertical,
                        CustomButton(
                          isLoading: state.statusAddProduct == Status.loading,
                          text: "add_to_cart".tr(),
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) {
                              showCustomToast(
                                title: "Please fill all required field".tr(),
                                type: ToastificationType.error,
                              );
                              return;
                            }
                            if (unitId == null || unitId!.isEmpty) {
                              showCustomToast(
                                title: "Please fill all required field".tr(),
                                type: ToastificationType.error,
                              );
                              return;
                            }
                            bloc.add(
                              AddNewProduct(
                                productId: selectProductId,
                                marketId: widget.marketId,
                                productName: nameController.text,
                                quantity:
                                    double.parse(
                                      getUnformattedValue(
                                            amountController.text,
                                          ) ??
                                          "",
                                    ).toString(),
                                unitId: data?.id ?? "",
                                description: descriptionController.text,
                              ),
                            );
                          },
                        ),
                        30.vertical,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
