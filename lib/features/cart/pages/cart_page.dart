// import 'package:bozorlik/app/theme.dart';
// import 'package:bozorlik/common/extension/number_extension.dart';
// import 'package:bozorlik/common/extension/widget_extantion.dart';
// import 'package:bozorlik/common/values/app_assets.dart';
// import 'package:bozorlik/common/widgets/custom_button.dart';
// import 'package:bozorlik/common/widgets/custom_error_widget.dart';
// import 'package:bozorlik/common/widgets/custom_scaffold_loading.dart';
// import 'package:bozorlik/common/widgets/loading_widget.dart';
// import 'package:bozorlik/features/cart/widgets/cart_item_widget.dart';
// import 'package:bozorlik/features/cart/widgets/cart_location_modal.dart';
// import 'package:bozorlik/features/cart/widgets/cart_name_modal.dart';
// import 'package:bozorlik/features/cart/widgets/cart_share_modal.dart';
// import 'package:bozorlik/features/main/notifiers/index_notifier.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../notifiers/all_carts_notifier.dart';
// import '../notifiers/cart_notifier.dart';
//
// class CartPage extends ConsumerWidget {
//   const CartPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cart = ref.watch(cartNotifierProvider);
//     final allCarts = ref.watch(allCartsNotifierProvider);
//     final cartName =
//         cart.valueOrNull?.name != null ? "${cart.value!.name}" : "";
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("cart".tr()),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: PopupMenuButton(
//               key: ValueKey(allCarts.valueOrNull?.length ?? 0),
//               child: Badge(
//                 isLabelVisible:
//                     allCarts.valueOrNull?.length != null &&
//                     allCarts.valueOrNull!.isNotEmpty,
//                 label: Text((allCarts.valueOrNull?.length ?? 0).toString()),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "active_lists".tr(),
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     8.horizontal,
//                     const Icon(
//                       CupertinoIcons.arrow_2_squarepath,
//                       color: AppColors.primaryColor,
//                     ),
//                   ],
//                 ),
//               ),
//               itemBuilder: (context) {
//                 return List.generate(allCarts.valueOrNull?.length ?? 0, (
//                   index,
//                 ) {
//                   final cartModel = allCarts.valueOrNull?[index];
//                   return PopupMenuItem(
//                     onTap: () {
//                       ref
//                           .read(allCartsNotifierProvider.notifier)
//                           .changeCurrentCart(cartId: cartModel!.id!);
//                     },
//                     value: cartModel?.id,
//                     child: Row(
//                       children: [
//                         Text(
//                           cartModel?.name ?? "",
//                           style: TextStyle(
//                             fontWeight:
//                                 cartModel?.isCurrent == true
//                                     ? FontWeight.bold
//                                     : FontWeight.normal,
//                             color:
//                                 cartModel?.isCurrent == true
//                                     ? Theme.of(context).colorScheme.primary
//                                     : null,
//                           ),
//                         ),
//                         if (cartModel?.isCurrent == true) ...[
//                           const SizedBox(width: 8),
//                           const Icon(
//                             Icons.check,
//                             size: 18,
//                             color: AppColors.primaryColor,
//                           ),
//                         ],
//                         Spacer(),
//                         GestureDetector(
//                           behavior: HitTestBehavior.deferToChild,
//                           onTap: () {
//                             // if (cartModel == null) return;
//                             Navigator.of(context).pop();
//                             CartNameModal.show(context, cartModel!);
//                           },
//
//                           child: Icon(
//                             Icons.edit,
//                             color: AppColors.primaryColor,
//                             size: 20,
//                           ),
//                         ),
//                         4.horizontal,
//                         GestureDetector(
//                           behavior: HitTestBehavior.deferToChild,
//                           onTap: () {
//                             ref
//                                 .read(allCartsNotifierProvider.notifier)
//                                 .deleteCart(cartId: cartModel!.id!);
//                             Navigator.of(context).pop();
//                           },
//
//                           child: Icon(
//                             CupertinoIcons.trash,
//                             color: AppColors.red600,
//                             size: 20,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//               },
//             ),
//           ),
//           if (cart.valueOrNull?.marketLists != null &&
//               cart.value!.marketLists!.isNotEmpty)
//             IconButton(
//               onPressed: () {
//                 CartShareModal.show(context, model: cart.value!);
//               },
//               icon: Icon(Icons.share),
//             ),
//         ],
//       ),
//       body: cart.when(
//         data: (data) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               ref.invalidate(allCartsNotifierProvider);
//               return await ref.read(allCartsNotifierProvider.future);
//             },
//             child:
//                 (data.marketLists == null || data.marketLists!.isEmpty)
//                     ? buildEmpty(ref)
//                     : Column(
//                       children: [
//                         Expanded(
//                           child: ListView.builder(
//                             itemBuilder: (context, index) {
//                               return CartItemWidget(
//                                 model: data.marketLists![index],
//                                 cart: data,
//                               );
//                             },
//                             itemCount: data.marketLists?.length ?? 0,
//                           ),
//                         ),
//                         10.vertical,
//                         CustomButton(
//                           text: "add_product".tr(),
//                           onTap: () {
//                             ref
//                                 .read(indexNotifierProvider.notifier)
//                                 .changeIndex(1);
//                           },
//                         ).paddingSymmetric(horizontal: 12),
//                         if (data.isAllBuy == true) ...[
//                           4.vertical,
//                           CustomOutlinedButton(
//                             text: "complete_shopping".tr(),
//                             onTap: () {
//                               CartLocationModal.show(context);
//                             },
//                           ).paddingSymmetric(horizontal: 12),
//                         ],
//                         10.vertical,
//                       ],
//                     ),
//           );
//         },
//         error: (e, s) {
//           return buildEmpty(ref);
//         },
//         loading: () => Center(child: LoadingWidget()),
//       ),
//     );
//   }
//
//   Center buildEmpty(WidgetRef ref) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SvgPicture.asset(AppIcons.emptyMarket, height: 200, width: 200),
//             12.vertical,
//             Text(
//               "cart_empty".tr(),
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//             ),
//             10.vertical,
//             Text(
//               "start_adding_products".tr(),
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//             ),
//             10.vertical,
//             CustomButton(
//               text: "view_products".tr(),
//               onTap: () {
//                 ref.read(indexNotifierProvider.notifier).changeIndex(1);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/bloc/cart_bloc.dart';
import 'package:bozorlik/features/cart/components/cart_item.dart';
import 'package:bozorlik/features/cart/pages/screens/inner_cart_page.dart';
import 'package:bozorlik/features/home/widgets/create_market_bottomsheet.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final bloc = CartBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                rightW: SizedBox(),
                text: "new_market".tr(),
                onTap: () {
                  showCupertinoModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => CreateMarketBottomsheet(),
                  ).then((v) {
                    bloc.add(GetCartEvent());
                  });
                },
                rightIcon: Container(
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5)),
                  child: Icon(Icons.add, color: AppColors.primaryColor),
                ),
              ),
            ),
            backgroundColor: AppColors.backGround,
            appBar: AppBar(backgroundColor: AppColors.backGround, title: Text("cart".tr())),
            body:
                state.status == Status.loading
                    ? Center(child: LoadingWidget())
                    : state.status == Status.empty
                    ? Center(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.emptyMarket, height: 200, width: 200),
                            12.vertical,
                            Text("cart_empty".tr(), textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                            10.vertical,
                            Text(
                              "start_adding_products".tr(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            10.vertical,

                            // CustomButton(
                            //   text: "view_products".tr(),
                            //   onTap: () {
                            //     bloc.add(GetCartEvent());
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    )
                    : state.status == Status.success
                    ? ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                      itemCount: state.data?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => InnerCartScreen(cartData: state.data![index]))).then((v){
                              if(v==true){
                                bloc.add(GetCartEvent());

                              }
                            });
                          },
                          child: CartItemNew(shopping: state.data?[index]),
                        );
                      },
                    )
                    : state.status == Status.error
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.noInternet),
                          10.vertical,
                          CustomButton(
                            text: state.errorMessage ?? "Xatolik",
                            onTap: () {
                              bloc.add(GetCartEvent());
                            },
                          ),
                        ],
                      ),
                    )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
