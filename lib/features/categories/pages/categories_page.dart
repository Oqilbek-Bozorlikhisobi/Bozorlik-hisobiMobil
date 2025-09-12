import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/widgets/custom_pagination_widget.dart';
import 'package:bozorlik/features/categories/notifiers/categories_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router.dart';
import '../../../common/values/app_assets.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../widgets/category_widget.dart';

class CategoriesPage extends HookConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    return Scaffold(
      appBar: AppBar(title: Text('categories'.tr())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              focusNode: focusNode,
              readOnly: true,
              onTap: () {
                focusNode.unfocus();
                context.push(AppRoutes.search);
              },
              hintText: "search_products_categories".tr(),
              prefixIcon: AppIcons.search,
            ),
            12.vertical,

            Text(
              "for_manufacturers_wholesalers".tr(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            // 6.vertical,
            // Text(
            //   "select_category_to_add".tr(),
            //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            // ),
            12.vertical,
            Expanded(
              child: CustomPaginationWidget(
                itemBuilder: (item) {
                  return CategoryWidget(model: item);
                },
                getItems: (page) async {
                  return await ref.read(
                    categoriesNotifierProvider(page: page).future,
                  );
                },
                isListView: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
