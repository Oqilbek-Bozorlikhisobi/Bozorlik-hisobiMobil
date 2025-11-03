import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/history/bloc/history_bloc.dart';
import 'package:bozorlik/features/history/pages/inner_history_page.dart';
import 'package:bozorlik/features/history/widgets/history_item_new.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
final ValueNotifier<bool> refreshNotifier2 = ValueNotifier(false);

class ComplatedMarkets extends StatefulWidget {
  const ComplatedMarkets({super.key, this.marketTypeId});

  final String? marketTypeId;

  @override
  State<ComplatedMarkets> createState() => _ComplatedMarketsState();
}

class _ComplatedMarketsState extends State<ComplatedMarkets> {
  final bloc = HistoryBloc();
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    bloc.add(GetHistoryEvent(marketTypeId: widget.marketTypeId));
  }

  @override
  void dispose() {
    _refreshController.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ComplatedMarkets oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.marketTypeId != widget.marketTypeId) {
      bloc.add(GetHistoryEvent(marketTypeId: widget.marketTypeId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state.status != Status.loading) {
            _refreshController.refreshCompleted();
          }
        },
        builder: (context, state) {
          return Builder(
            builder: (context) {
              return state.status == Status.loading
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
                        ],
                      ),
                    ),
                  )
                  : state.status == Status.success
                  ? SmartRefresher(
                    controller: _refreshController,
                    enablePullUp: true,
                    enablePullDown: true,
                    header: MaterialClassicHeader(
                      color: AppColors.primaryColor,
                    ),
                    onRefresh: () {
                      bloc.add(GetHistoryEvent());
                    },
                    onLoading: () {
                      bloc.add(NextGetHistoryEvent());
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 80),
                      itemCount: state.items?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder:
                                    (context) => InnerHistoryScreen(
                                      cartData: state.items![index],
                                    ),
                              ),
                            );
                          },
                          child: HistoryItemNew(shopping: state.items![index]),
                        );
                      },
                    ),
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
                            bloc.add(GetHistoryEvent());
                          },
                        ),
                      ],
                    ),
                  )
                  : SizedBox();
            },
          );
        },
      ),
    );
  }
}
