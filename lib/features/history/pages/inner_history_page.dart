import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/features/cart/pages/screens/components/buy_product.dart';
import 'package:bozorlik/features/history/models/get_all_history_response.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/price_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
class InnerHistoryScreen extends StatefulWidget {
  const InnerHistoryScreen({super.key, required this.cartData});

  final HistoryResponseDataData cartData;

  @override
  State<InnerHistoryScreen> createState() => _InnerHistoryScreenState();
}

class _InnerHistoryScreenState extends State<InnerHistoryScreen> {
  final bloc = InnerCartBloc();
  double _currentValue = 10;

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
            backgroundColor: AppColors.backGround,
            appBar: AppBar(backgroundColor: AppColors.backGround, title: Text(widget.cartData.name ?? "")),
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
                                : state.status==Status.success? Container(
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
                                              return BuyProduct(state: state, index: index);
                                            },
                                          ),
                                ):SizedBox(),
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
