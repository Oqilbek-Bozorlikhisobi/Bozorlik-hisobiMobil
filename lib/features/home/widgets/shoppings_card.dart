import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/features/main/notifiers/index_notifier.dart';
import 'package:bozorlik/utils/date_formatter.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Shoppings extends ConsumerStatefulWidget  {
  const Shoppings({super.key, required this.bloc});

  final HomeBloc bloc;

  @override
  ConsumerState<Shoppings> createState() => _ShoppingsState();
}

class _ShoppingsState extends ConsumerState<Shoppings> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.white),
          child: Column(
            children: [
              GestureDetector(

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("shoppings".tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black)),
                      InkWell(
                        onTap: (){
                          ProviderScope.containerOf(context).read(indexNotifierProvider.notifier).changeIndex(2);
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.grey.withOpacity(0.2)),
                          child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.black, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child:
                    state.statusMarket == Status.loading
                        ? LoadingWidget()
                        : state.statusMarket == Status.error
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              widget.bloc.add(GetMarketabilityEvent());
                              // ref.invalidate(historyNotifierProvider);
                            },
                            child: Stack(
                              children: [
                                // SvgPicture.asset(AppIcons.noInternet),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.refresh),
                                      Text(state.errorMessageMarket ?? "Xatolik", style: Theme.of(context).textTheme.titleMedium),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        : state.statusMarket == Status.success
                        ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          itemCount: state.marketData?.length,
                          itemBuilder: (context, index) {
                            final shopping = state.marketData?[index];
                            return Container(
                              width: 300,
                              margin: EdgeInsets.only(right: 12),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.backGround,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.grey.withValues(alpha: 0.2), width: 1),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 52,
                                    height: 52,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.star,
                                          width: 56,
                                          height: 56,
                                          colorFilter: ColorFilter.mode(Color.fromRGBO(255, 194, 102, 1), BlendMode.srcIn),
                                        ),
                                        Text(
                                          (shopping?.name ?? "O").substring(0, 1).toUpperCase(),
                                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "${shopping?.name ?? ""}: ",
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "#${shopping?.marketType?.titleUz ?? shopping?.name ?? ""}",
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       child: Text(
                                        //         overflow: TextOverflow.ellipsis,
                                        //         "${shopping?.name ?? ""}: ",
                                        //         style: Theme.of(
                                        //           context,
                                        //         ).textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black),
                                        //       ),
                                        //     ),
                                        //     Expanded(
                                        //       flex: 2,
                                        //       child: Text(
                                        //         textAlign: TextAlign.start,
                                        //         overflow: TextOverflow.ellipsis,
                                        //         "#${shopping?.marketType?.titleUz ?? shopping?.name ?? ""}",
                                        //         style: Theme.of(
                                        //           context,
                                        //         ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            // Members
                                            SvgPicture.asset(AppIcons.receipt, height: 18, width: 18),
                                            SizedBox(width: 4),
                                            Text(
                                              "${state.marketData?.length}",
                                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                fontSize: 12,
                                                color: Color.fromRGBO(75, 75, 75, 1),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text("|"),
                                            SizedBox(width: 8),
                                            SvgPicture.asset(AppIcons.wallet, height: 18, width: 18),
                                            SizedBox(width: 4),
                                            Text(
                                              NumberFormat('#,###', 'en_US').format(shopping?.totalPrice ?? 0).replaceAll(',', ' '),
                                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                fontSize: 12,
                                                color: Color.fromRGBO(75, 75, 75, 1),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Text("|"),
                                            SizedBox(width: 8),
                                            SvgPicture.asset(AppIcons.calendar, height: 18, width: 18),
                                            // Date
                                            // Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.grey),
                                            SizedBox(width: 4),
                                            Text(
                                              formatDate(shopping?.createdAt ?? ""),
                                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                fontSize: 12,
                                                color: Color.fromRGBO(75, 75, 75, 1),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                        : state.statusMarket == Status.empty
                        ? Column(
                          children: [
                            SvgPicture.asset(AppIcons.emptyMarket, height: 40, width: 40),
                            12.vertical,
                            Text("cart_empty".tr(), textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                          ],
                        )
                        : SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShoppingsItem {
  final String title;
  final String tag;
  final int members;
  final int price;
  final String date;
  final Color color;

  ShoppingsItem({required this.color, required this.title, required this.tag, required this.members, required this.price, required this.date});
}
