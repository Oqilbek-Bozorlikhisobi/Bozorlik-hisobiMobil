import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_dropdown.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/models/unit_model.dart';
import 'package:bozorlik/features/products/notifiers/units_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductAddModal extends HookConsumerWidget {
  const ProductAddModal({super.key, required this.model});

  final ProductModel? model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final descriptionController = useTextEditingController();
    final amountController = useTextEditingController();
    final units = ref.watch(unitsNotifierProvider);
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameFocusNode = useFocusNode();
    final amountFocusNode = useFocusNode();
    final unit = useState<UnitModel?>(null);
    final unitNotifier = ref.watch(unitsNotifierProvider.notifier);
    useEffect(() {
      if (model == null) {
        nameFocusNode.requestFocus();
      } else {
        amountFocusNode.requestFocus();
      }
      return null;
    }, [0]);
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (model != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedNetworkImage(
                  imageUrl: model!.image ?? "",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
              10.vertical,
              Text(
                context.localizedTitle(
                      model!.titleUz,
                      model!.titleRu,
                      model!.titleEn,
                    ) ??
                    "-",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              10.vertical,
            ],
            if (model == null) ...[
              CustomTextField(
                labelText: "product_name".tr(),
                focusNode: nameFocusNode,
                controller: descriptionController,
                hintText: "product_name_example".tr(),
              ),
              10.vertical,
            ],
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomTextField(
                    focusNode: amountFocusNode,
                    labelText: "amount".tr(),
                    validatorText: "required_field".tr(),
                    hintText: "amount_example".tr(),
                    textInputType: TextInputType.numberWithOptions(),
                    controller: amountController,
                  ),
                ),
                8.horizontal,
                Expanded(
                  flex: 2,
                  child: CustomDropdown(
                    height: 120,
                    selectedValue: unit.value?.name,
                    validatorText: "required_field".tr(),
                    labelText: "measurement_unit".tr(),
                    hintText: "piece".tr(),
                    items: unitNotifier.getUnitNames(units.valueOrNull ?? []),
                    onChanged: (String? value) {
                      unit.value = unitNotifier.findUnitByName(
                        name: value!,
                        units: units.valueOrNull ?? [],
                      );
                    },
                  ),
                ),
              ],
            ),

            20.vertical,
            CustomButton(
              isLoading: isLoading.value,
              text: "add_to_cart".tr(),
              onTap: () async {
                if (!formKey.currentState!.validate()) return;
                isLoading.value = true;
                try {
                  await ref
                      .read(cartNotifierProvider.notifier)
                      .addProductToCart(
                        product: model,
                        name: descriptionController.text,
                        amount: double.tryParse(amountController.text) ?? 0,
                        unitId: unit.value?.id ?? "",
                      );
                } catch (e, s) {}
                isLoading.value = false;
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
            30.vertical,
          ],
        ),
      ),
    );
  }

  static Future show(
    BuildContext context, {
    required ProductModel? model,
  }) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => ProductAddModal(model: model),
    );
  }
}
