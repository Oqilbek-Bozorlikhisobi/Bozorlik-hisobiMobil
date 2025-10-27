import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/pages/screens/components/buy_product.dart';
import 'package:bozorlik/features/history/bloc/history_bloc.dart';
import 'package:bozorlik/features/history/models/get_all_history_response.dart';
import 'package:bozorlik/features/history/widgets/buy_product_history.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/price_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'market_share_screen_history.dart';

class InnerHistoryScreen extends StatefulWidget {
  const InnerHistoryScreen({super.key, required this.cartData});

  final HistoryResponseDataData cartData;

  @override
  State<InnerHistoryScreen> createState() => _InnerHistoryScreenState();
}

class _InnerHistoryScreenState extends State<InnerHistoryScreen> {
  final bloc = HistoryBloc();
  double _currentValue = 10;

  @override
  void initState() {
    super.initState();
    bloc.add(GetByIdHistoryEvent(historyId: widget.cartData.id ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backGround,
            appBar: AppBar(
              backgroundColor: AppColors.backGround,
              title: Text(widget.cartData.name ?? ""),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => MarketShareScreenHistory(shopping: widget.cartData,)));
                  },
                  child: SvgPicture.asset(AppIcons.addUser),
                ),
              ],
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
                              5.horizontal,
                              Expanded(
                                child: Text(
                                  maxLines: 1,
                                  textAlign: TextAlign.end,

                                  overflow: TextOverflow.ellipsis,
                                  widget.cartData.name ?? "",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                                ),
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
                              5.horizontal,

                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.end,
                                  PriceFormatterService.formatPrice(widget.cartData.totalPrice.toString() ?? ""),
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          10.vertical,
                          Builder(
                            builder: (context) {
                              // final totalProducts = (state.unBuyProducts?.length ?? 0) + (state.buyProducts?.length ?? 0);
                              // final boughtProducts = state.buyProducts?.length ?? 0;
                              //
                              // if (totalProducts == 0) {
                              //   return SizedBox();
                              // }
                              // return Container(
                              //     width: double.infinity,
                              //     height: 6,
                              //     decoration: BoxDecoration(color: AppColors.primaryColor));
                              return LinearProgressIndicator(
                                value: (state.innerHistory?.marketLists?.length.toDouble()),
                                backgroundColor: AppColors.primaryColor,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                                minHeight: 6,
                                borderRadius: BorderRadius.circular(3),
                              );
                            },
                          ),
                          10.vertical,
                          Row(children: [Text("buy_products".tr()), Text("${state.innerHistory?.marketLists?.length}")]),
                        ],
                      ),
                    ),
                  ),
                  16.vertical,
                  Text("products_cart".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 18)),

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
                                : state.status == Status.success
                                ? Container(
                                  child:
                                      (state.innerHistory?.marketLists?.isEmpty ?? false)
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
                                            itemCount: state.innerHistory?.marketLists?.length,
                                            itemBuilder: (context, index) {
                                              return BuyProductHistory(state: state, index: index);
                                            },
                                          ),
                                )
                                : SizedBox(),
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
