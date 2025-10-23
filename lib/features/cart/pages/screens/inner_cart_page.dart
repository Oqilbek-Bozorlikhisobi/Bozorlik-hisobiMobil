import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/price_formatter.dart';
import 'package:bozorlik/utils/textfield_summ_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/cart_share_modal.dart';
import 'components/buy_product.dart';
import 'components/buy_product_bottomsheet.dart';
import 'components/delete_product_bottomsheet.dart';
import 'components/end_market_bottomsheet.dart';
import 'components/info_product_bottomsheet.dart';
import 'components/product_add.dart';
import 'components/product_add_cart.dart';
import 'components/un_buy_product.dart';

class InnerCartScreen extends StatefulWidget {
  const InnerCartScreen({super.key, required this.cartData});

  final CartResponseData cartData;

  @override
  State<InnerCartScreen> createState() => _InnerCartScreenState();
}

class _InnerCartScreenState extends State<InnerCartScreen> {
  final bloc = InnerCartBloc();
  double _currentValue = 10;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(GetInnerByIdEvent(id: widget.cartData.id ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<InnerCartBloc, InnerCartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation: _selectedIndex == 0 ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.centerFloat,
            floatingActionButton:
                _selectedIndex == 0
                    ? GestureDetector(
                      onTap: () async {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder:
                              (context) => ProductAddCartLocaleBottomsheet(marketName: widget.cartData.name ?? "", marketId: widget.cartData.id ?? ""),
                        ).then((v) {
                          if (v != null) {
                            MarketLists vData = v;
                            bloc.add(
                              AddNewProductLocalEvent(
                                buyProduct: MarketLists(
                                  id: vData.id,
                                  productName: vData.productName,
                                  quantity: double.parse(getUnformattedValue(vData.quantity.toString() ?? "") ?? "1"),
                                  unit: vData.unit,
                                  isBuying: true,
                                  description: vData.description,
                                ),
                              ),
                            );
                          }
                        });
                      },
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.white),
                            child: Center(child: Icon(Icons.add, color: AppColors.primaryColor)),
                          ),
                        ),
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomButton(
                        text: "${"end_market".tr()} 🎉",
                        onTap: () {
                          showCupertinoModalBottomSheet(
                            context: context,
                            builder:
                                (context) =>
                                    EndMarketBottomsheet(marketTypeId: widget.cartData.marketType?.id ?? "", marketId: widget.cartData.id ?? ""),
                          );
                        },
                      ),
                    ),
            backgroundColor: AppColors.backGround,
            appBar: AppBar(
              actions: [
                GestureDetector(
                  onTap: () {
                    CartShareModal.show(context, marketId: widget.cartData.id ?? "");
                  },
                  child: SvgPicture.asset(AppIcons.addUser),
                ),
              ],
              backgroundColor: AppColors.backGround,
              title: Text(widget.cartData.name ?? ""),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("infos".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18)),
                  12.vertical,

                  Container(
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "market_department".tr(),
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Text(
                                widget.cartData.name ?? "",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "market_summ".tr(),
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Text(
                                PriceFormatterService.formatPrice(widget.cartData.totalPrice.toString() ?? ""),
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                          10.vertical,
                          state.status == Status.loading
                              ? LoadingWidget()
                              : ((state.unBuyProducts?.isNotEmpty ?? false) && (state.buyProducts?.isNotEmpty ?? false))
                              ? SizedBox()
                              : Builder(
                                builder: (context) {
                                  final totalProducts = (state.unBuyProducts?.length ?? 0) + (state.buyProducts?.length ?? 0);
                                  final boughtProducts = state.buyProducts?.length ?? 0;

                                  if (totalProducts == 0) {
                                    return SizedBox();
                                  }

                                  return LinearProgressIndicator(
                                    value: boughtProducts / totalProducts,
                                    backgroundColor: AppColors.grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                                    minHeight: 6,
                                    borderRadius: BorderRadius.circular(3),
                                  );
                                },
                              ),
                          10.vertical,
                          Row(
                            children: [
                              Text("buy_products".tr()),
                              Text(" ${(state.buyProducts?.length ?? 0)}/${(state.unBuyProducts?.length ?? 0) + (state.buyProducts?.length ?? 0)}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.vertical,
                  Text("products_cart".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18)),
                  12.vertical,

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 0 ? AppColors.primaryColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    'must_be_taken'.tr(),
                                    style: TextStyle(
                                      color: _selectedIndex == 0 ? Colors.white : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 7),
                                decoration: BoxDecoration(
                                  color: _selectedIndex == 1 ? AppColors.primaryColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    'purchased'.tr(),
                                    style: TextStyle(
                                      color: _selectedIndex == 1 ? Colors.white : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.vertical,

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        child:
                            state.status == Status.loading
                                ? LoadingWidget()
                                : state.status == Status.empty
                                ? Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(AppIcons.emptyMarket, height: 200, width: 200),
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
                                      ],
                                    ),
                                  ),
                                )
                                : _selectedIndex == 0
                                ? Container(
                                  child:
                                      (state.unBuyProducts?.isEmpty ?? false)
                                          ? Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(AppIcons.emptyMarket, height: 120, width: 120),
                                                  12.vertical,
                                                  Text(
                                                    "cart_empty".tr(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          : ListView.builder(
                                            itemCount: state.unBuyProducts?.length ?? 0,
                                            itemBuilder: (context, index) {
                                              // Add this safety check
                                              if (state.unBuyProducts == null || index >= state.unBuyProducts!.length) {
                                                return SizedBox.shrink();
                                              }

                                              final product = state.unBuyProducts![index];

                                              return UnBuyProduct(
                                                state: state,
                                                index: index,
                                                onTapInfo: () {
                                                  showCupertinoModalBottomSheet(
                                                    context: context,
                                                    builder: (context) => InfoProductBottomsheet(product: product),
                                                  );
                                                },
                                                onTapBuy: () {
                                                  // print("===================");
                                                  // print("${product.id}");
                                                  // print("===================");
                                                  showCupertinoModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return BuyProductBottomsheet(
                                                        product: product,
                                                        save: (double price, Unit unit) {
                                                          context.pop();

                                                          bloc.add(
                                                            BuyProductEvent(
                                                              buyProduct: MarketLists(
                                                                id: product.id,
                                                                productName: product.productName,
                                                                quantity: (product.quantity) ?? 1,
                                                                price: price.toInt(),
                                                                unit: unit,
                                                                isBuying: true,
                                                                description: product.description,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        marketListId: product.id,
                                                      );
                                                    },
                                                  );
                                                },
                                                onTapDelete: () {
                                                  showCupertinoModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (context) => DeleteProductBottomsheet(
                                                          product: product,
                                                          deleteProduct: (String id) {
                                                            bloc.add(DeleteProductEvent(id: id));
                                                            context.pop();
                                                          },
                                                        ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                )
                                : Container(
                                  child:
                                      (state.buyProducts?.isEmpty ?? false)
                                          ? Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(AppIcons.emptyMarket, height: 120, width: 120),
                                                  12.vertical,
                                                  Text(
                                                    "cart_empty".tr(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                                  ),
                                                  // 10.vertical,
                                                  // Text(
                                                  //   "start_adding_products".tr(),
                                                  //   textAlign: TextAlign.center,
                                                  //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                                  // ),
                                                  // 10.vertical,
                                                ],
                                              ),
                                            ),
                                          )
                                          : ListView.builder(
                                            itemCount: state.buyProducts?.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                  onTap: (){
                                                    showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) => InfoProductBottomsheet(product: state.buyProducts?[index]),
                                                    );
                                                  },
                                                  child: BuyProduct(state: state, index: index));
                                            },
                                          ),
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
