import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/features/categories/models/category_model.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/custom_pagination_widget.dart';
import '../../categories/widgets/category_widget.dart';
import '../notifiers/products_notifier.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizedTitle(model.titleUz, model.titleRu, model.titleEn) ??
              "-",
        ),
      ),
      body: CustomPaginationWidget(
        customWidget: ProductAdd(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        itemBuilder: (item) {
          return ProductWidget(model: item);
        },
        getItems: (page) async {
          return await ref.read(
            productsNotifierProvider(
              page: page,
              categoryId: model.id ?? "",
            ).future,
          );
        },
        isListView: false,
      ),
    );
  }
}
