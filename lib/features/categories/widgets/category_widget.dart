import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/features/cart/notifiers/cart_notifier.dart';
import 'package:bozorlik/features/categories/models/category_model.dart';
import 'package:bozorlik/features/categories/widgets/cart_create_modal.dart';
import 'package:bozorlik/features/products/widgets/product_add_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        try {
          final cart = await ref.read(cartNotifierProvider.future);
          if (cart.name == null) {
            final result = await CartCreateModal.show(context);
            if (result != null && result is bool && result == true) {
              context.push(AppRoutes.products, extra: model);
            }
          } else {
            context.push(AppRoutes.products, extra: model);
          }
        } catch (e, s) {}
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGroupedBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: CustomCachedNetworkImage(imageUrl: model.image ?? ""),
              ),
            ),
          ),
          4.vertical,
          Text(
            context.localizedTitle(
                  model.titleUz,
                  model.titleRu,
                  model.titleEn,
                ) ??
                "-",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ProductAdd extends ConsumerWidget {
  const ProductAdd({super.key, this.aspectRatio = 1, this.textSize = 12});

  final double aspectRatio;
  final double textSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        try {
          final cart = await ref.read(cartNotifierProvider.future);
          if (cart.name == null) {
            if (context.mounted) {
              CartCreateModal.show(context);
            }
          } else {
            ProductAddModal.show(context, model: null);
          }
        } catch (e, s) {}
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // border: Border.all(color: AppColors.primaryColor, width: 4),
                color: Color(0xFF85dc3c),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                CupertinoIcons.cart_badge_plus,
                size: 50,
                color: CupertinoColors.white,
              ),
            ),
          ),
          4.vertical,
          Text(
            "product_name".tr(),
            style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w600),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
