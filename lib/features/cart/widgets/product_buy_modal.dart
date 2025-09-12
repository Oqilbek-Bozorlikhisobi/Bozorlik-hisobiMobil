import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'no_image_widget.dart';

class ProductBuyModal extends HookConsumerWidget {
  const ProductBuyModal({super.key, required this.model});

  final CartItem model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = model.product;
    final amountController = useTextEditingController();
    final isLoading = useState(false);
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    product?.image != null
                        ? CustomCachedNetworkImage(
                          imageUrl:
                              model.product?.image ??
                              "https://img.freepik.com/premium-vector/no-photo-available-vector-icon-default-image-symbol-picture-coming-soon-web-site-mobile-app_87543-18055.jpg",
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: 300,
                        )
                        : NoImageWidget(height: 300, width: double.infinity),
              ),
              10.vertical,
              Text(
                context.localizedTitle(
                      model.product?.titleUz,
                      model.product?.titleRu,
                      model.product?.titleEn,
                    ) ??
                    model.productName ??
                    "-",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              10.vertical,

              CustomTextField(
                labelText: "price".tr(),
                hintText: "enter_price".tr(),
                textInputType: TextInputType.numberWithOptions(),
                controller: amountController,
              ),
              20.vertical,
              CustomButton(
                isLoading: isLoading.value,
                text: "buy".tr(),
                onTap: () async {
                  isLoading.value = true;
                  try {
                    await ref
                        .read(cartNotifierProvider.notifier)
                        .buyProduct(
                          productId: model.id ?? "",
                          price: amountController.text,
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
        ],
      ),
    );
  }

  static Future show(BuildContext context, {required CartItem model}) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => ProductBuyModal(model: model),
    );
  }
}
