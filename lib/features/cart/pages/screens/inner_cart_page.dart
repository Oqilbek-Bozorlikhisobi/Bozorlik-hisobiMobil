import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/bloc/inner_cart/inner_cart_bloc.dart';
import 'package:bozorlik/features/cart/models/cart_response.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/price_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'components/buy_product.dart';
import 'components/info_product_bottomsheet.dart';
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
                              : (state.data?.marketLists?.isNotEmpty ?? false)
                              ? SliderTheme(
                                data: SliderThemeData(
                                  activeTrackColor: AppColors.primaryColor,
                                  inactiveTrackColor: AppColors.grey,
                                  thumbShape: SliderComponentShape.noThumb,
                                  overlayShape: SliderComponentShape.noOverlay,
                                  trackHeight: 6,
                                ),
                                child: Slider(
                                  min: 0,
                                  max: (state.data?.marketLists?.length ?? 0).toDouble(),
                                  value: _currentValue.clamp(0, (state.data?.marketLists?.length ?? 10).toDouble()),
                                  onChanged: (v) {
                                    setState(() {
                                      _currentValue = v;
                                    });
                                  },
                                ),
                              )
                              : SizedBox(),
                          10.vertical,
                          Row(
                            children: [Text("buy_products".tr()), Text(" ${state.buyProducts?.length ?? 0}/${state.data?.marketLists?.length ?? 0}")],
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
                                    'Olinishi kerak',
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
                                    'Sotib olingan',
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
                                ? ListView.builder(
                                  itemCount: state.data?.marketLists?.length,
                                  itemBuilder: (context, index) {
                                    return UnBuyProduct(
                                      state: state,
                                      index: index,
                                      onTapInfo: () {
                                        showCupertinoModalBottomSheet(
                                          context: context,
                                          builder: (context) => InfoProductBottomsheet(product: state.data?.marketLists?[index]),
                                        );
                                      },
                                      onTapBuy: () {},
                                      onTapDelete: () {},
                                    );
                                  },
                                )
                                : ListView.builder(
                                  itemCount: state.data?.marketLists?.length,
                                  itemBuilder: (context, index) {
                                    return BuyProduct(state: state, index: index);
                                  },
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
