import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/extension/widget_extantion.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/custom_error_widget.dart';
import 'package:bozorlik/common/widgets/custom_scaffold_loading.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/widgets/cart_item_widget.dart';
import 'package:bozorlik/features/cart/widgets/cart_location_modal.dart';
import 'package:bozorlik/features/cart/widgets/cart_share_modal.dart';
import 'package:bozorlik/features/main/notifiers/index_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifiers/all_carts_notifier.dart';
import '../notifiers/cart_notifier.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartNotifierProvider);
    final allCarts = ref.watch(allCartsNotifierProvider);
    final cartName =
        cart.valueOrNull?.name != null ? "${cart.value!.name}" : "";
    return Scaffold(
      appBar: AppBar(
        title: Text("cart".tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: PopupMenuButton(
              key: ValueKey(allCarts.valueOrNull?.length ?? 0),
              child: Badge(
                isLabelVisible:
                    allCarts.valueOrNull?.length != null &&
                    allCarts.valueOrNull!.isNotEmpty,
                label: Text((allCarts.valueOrNull?.length ?? 0).toString()),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "active_lists".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    8.horizontal,
                    const Icon(
                      CupertinoIcons.arrow_2_squarepath,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
              itemBuilder: (context) {
                return List.generate(allCarts.valueOrNull?.length ?? 0, (
                  index,
                ) {
                  final cartModel = allCarts.valueOrNull?[index];
                  return PopupMenuItem(
                    onTap: () {
                      ref
                          .read(allCartsNotifierProvider.notifier)
                          .changeCurrentCart(cartId: cartModel!.id!);
                    },
                    value: cartModel?.id,
                    child: Row(
                      children: [
                        Text(
                          cartModel?.name ?? "",
                          style: TextStyle(
                            fontWeight:
                                cartModel?.isCurrent == true
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color:
                                cartModel?.isCurrent == true
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                          ),
                        ),
                        if (cartModel?.isCurrent == true) ...[
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.check,
                            size: 18,
                            color: AppColors.primaryColor,
                          ),
                        ],
                        Spacer(),
                        GestureDetector(
                          behavior: HitTestBehavior.deferToChild,
                          onTap: () {
                            ref
                                .read(allCartsNotifierProvider.notifier)
                                .deleteCart(cartId: cartModel!.id!);
                            Navigator.of(context).pop();
                          },

                          child: Icon(
                            CupertinoIcons.trash,
                            color: AppColors.red600,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ),
          if (cart.valueOrNull?.marketLists != null &&
              cart.value!.marketLists!.isNotEmpty)
            IconButton(
              onPressed: () {
                CartShareModal.show(context, model: cart.value!);
              },
              icon: Icon(Icons.share),
            ),
        ],
      ),
      body: cart.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(allCartsNotifierProvider);
              return await ref.read(allCartsNotifierProvider.future);
            },
            child:
                (data.marketLists == null || data.marketLists!.isEmpty)
                    ? buildEmpty(ref)
                    : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CartItemWidget(
                                model: data.marketLists![index],
                                cart: data,
                              );
                            },
                            itemCount: data.marketLists?.length ?? 0,
                          ),
                        ),
                        10.vertical,
                        CustomButton(
                          text: "add_product".tr(),
                          onTap: () {
                            ref
                                .read(indexNotifierProvider.notifier)
                                .changeIndex(1);
                          },
                        ).paddingSymmetric(horizontal: 12),
                        if (data.isAllBuy == true) ...[
                          4.vertical,
                          CustomOutlinedButton(
                            text: "complete_shopping".tr(),
                            onTap: () {
                              CartLocationModal.show(context);
                            },
                          ).paddingSymmetric(horizontal: 12),
                        ],
                        10.vertical,
                      ],
                    ),
          );
        },
        error: (e, s) {
          return buildEmpty(ref);
        },
        loading: () => Center(child: LoadingWidget()),
      ),
    );
  }

  Center buildEmpty(WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.empty, height: 200, width: 200),
            12.vertical,
            Text(
              "cart_empty".tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            10.vertical,
            Text(
              "start_adding_products".tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            10.vertical,
            CustomButton(
              text: "view_products".tr(),
              onTap: () {
                ref.read(indexNotifierProvider.notifier).changeIndex(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
