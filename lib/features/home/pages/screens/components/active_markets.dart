import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/cart/bloc/cart_bloc.dart';
import 'package:bozorlik/features/cart/components/cart_item.dart';
import 'package:bozorlik/features/cart/pages/screens/inner_cart_page.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
final ValueNotifier<bool> refreshNotifier = ValueNotifier(false);

class ActiveMarkets extends StatefulWidget {
  const ActiveMarkets({super.key, required this.marketId, });
final String? marketId;
  @override
  State<ActiveMarkets> createState() => _ActiveMarketsState();
}

class _ActiveMarketsState extends State<ActiveMarkets> {
  final bloc = CartBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(GetCartEvent(marketId: widget.marketId));
  }

  @override
  void didUpdateWidget(covariant ActiveMarkets oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.marketId != widget.marketId) {
      bloc.add(GetCartEvent(marketId: widget.marketId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          },
        builder: (context, state) {
          return Builder(
            builder: (context) {
              return   state.status == Status.loading
                  ? Center(child: LoadingWidget())
                  : state.status == Status.empty
                  ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppIcons.emptyMarket,
                        height: 100,
                        width: 100,
                      ),
                      12.vertical,
                      Text(
                        "cart_empty".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      10.vertical,
                      Text(
                        "start_adding_products".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 80),
                itemCount: state.data?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context)
                      //     .push(
                      //   CupertinoPageRoute(
                      //     builder:
                      //         (context) => InnerCartScreen(
                      //       cartData: state.data![index],
                      //     ),
                      //   ),
                      // )
                      //     .then((v) {
                      //   if (v == true) {
                      //     bloc.add(GetCartEvent());
                      //   }
                      // });
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
                  : SizedBox();
            }
          );
        },
      ),
    );
  }
}
