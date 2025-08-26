import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/features/cart/models/cart_model.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/cart/widgets/no_image_widget.dart';
import 'package:bozorlik/features/cart/widgets/product_buy_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({super.key, required this.model, required this.cart});

  final CartItem model;
  final CartModel cart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = model.product;
    final buttonColor =
        model.isBuying == false
            ? AppColors.primaryColor
            : CupertinoColors.systemGrey;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CupertinoColors.extraLightBackgroundGray),
        ),
      ),
      height: 120,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child:
                product?.image != null
                    ? CustomCachedNetworkImage(
                      imageUrl: product!.image!,
                      height: 100,
                      width: 100,
                    )
                    : NoImageWidget(height: 100, width: 100),
          ),
          4.horizontal,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${context.localizedTitle(product?.titleUz, product?.titleRu, product?.titleEn) ?? model.productName ?? ""} ${model.productType != null ? "(${model.productType})" : ""}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                if (model.quantity != null)
                  Text(
                    "${model.quantity} ${model.unit?.name ?? ""}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                if (model.user?.fullName != null &&
                    cart.users != null &&
                    cart.users!.length > 1)
                  Text("👤${model.user!.fullName!}"),
                4.vertical,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoButton.tinted(
                      sizeStyle: CupertinoButtonSize.medium,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      onPressed: () {
                        {
                          if (model.isBuying == true) return;
                          ProductBuyModal.show(context, model: model);
                        }
                      },
                      child: Text(
                        (model.isBuying == true) ? "received".tr() : "buy".tr(),
                        style: TextStyle(
                          decoration:
                              (model.isBuying == true)
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                        ),
                      ),
                    ),
                    8.horizontal,
                    Container(
                      height: 20,
                      width: 1,
                      color: CupertinoColors.systemGrey,
                    ),
                    8.horizontal,
                    CupertinoTheme(
                      data: CupertinoTheme.of(context).copyWith(
                        primaryColor: AppColors.red600, // your tinted color
                      ),
                      child: CupertinoButton.tinted(
                        sizeStyle: CupertinoButtonSize.medium,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .deleteProduct(productId: model.id ?? "");
                        },

                        child: Text(
                          "delete".tr(),
                          style: TextStyle(color: AppColors.red600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          8.horizontal,

          // CustomButton(
          //   height: 40,
          //   text: (model.isBuying == true) ? "received".tr() : "buy".tr(),
          //   textColor: buttonColor,
          //   onTap: () {
          //     if (model.isBuying == true) return;
          //     ProductBuyModal.show(context, model: model);
          //   },
          //   width: null,
          //   bgColor: CupertinoColors.white,
          //   borderColor: buttonColor,
          //   leftIcon: Icon(
          //     CupertinoIcons.check_mark_circled_solid,
          //     color: buttonColor,
          //   ),
          // ),
          // 4.horizontal,
          // CustomButton(
          //   height: 40,
          //   text: "",
          //   onTap: () {
          //     ref
          //         .read(cartNotifierProvider.notifier)
          //         .deleteProduct(productId: model.id ?? "");
          //   },
          //   width: 40,
          //   bgColor: CupertinoColors.white,
          //   borderColor: CupertinoColors.systemGrey,
          //   leftIcon: Icon(CupertinoIcons.trash_fill, color: AppColors.red600),
          // ),
        ],
      ),
    );
  }
}
