import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_text_field.dart';
import 'package:bozorlik/features/cart/notifiers/all_carts_notifier.dart';
import 'package:bozorlik/features/categories/models/category_model.dart';
import 'package:bozorlik/features/home/widgets/banners_widget.dart';
import 'package:bozorlik/features/home/widgets/no_market_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/custom_pagination_widget.dart';
import '../../cart/notifiers/cart_notifier.dart';
import '../../categories/notifiers/categories_notifier.dart';
import '../../categories/widgets/category_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final focusNode = useFocusNode();
    return Scaffold(
      appBar: AppBar(title: Text('welcome'.tr())),
      body: ListView(
        children: [
          if (
          // cart.isLoading == false ||
          //     cart.valueOrNull?.name == null ||
              true) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: NoMarketWidget(),
            ),
            16.vertical,
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomTextField(
              focusNode: focusNode,
              readOnly: true,
              onTap: () {
                focusNode.unfocus();
                context.push(AppRoutes.search);
              },
              hintText: "search_products_categories".tr(),
              prefixIcon: AppIcons.search,
            ),
          ),
          16.vertical,
          const BannersWidget(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "select_category".tr(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
          6.vertical,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "select_category_to_add".tr(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          12.vertical,
          CustomPaginationWidget(
            customWidget: ProductAdd(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
        ],
      ),
    );
  }
}
