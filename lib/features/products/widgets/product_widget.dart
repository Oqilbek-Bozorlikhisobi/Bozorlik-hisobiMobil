import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_network_image.dart';
import 'package:bozorlik/features/categories/models/category_model.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/widgets/product_add_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProductAddModal.show(context, model: model);
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
