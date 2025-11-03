import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/features/home/pages/screens/bloc/department_header/department_header_bloc.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:bozorlik/utils/price_formatter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DepartmentBanner extends StatefulWidget {
  const DepartmentBanner({
    super.key,
    required this.bloc,
    required this.currentIndex,
  });

  final HomeBloc bloc;
  final Function(String marketTypeId) currentIndex;

  @override
  State<DepartmentBanner> createState() => _DepartmentBannerState();
}

class _DepartmentBannerState extends State<DepartmentBanner> {
  int _current = 0;
  final bloc = DepartmentHeaderBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<DepartmentHeaderBloc, DepartmentHeaderState>(
        listener: (context, state2) {},
        builder: (context, state2) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    state.statusDepartment == Status.loading
                        ? Column(children: [LoadingWidget(), 20.vertical])
                        : state.statusDepartment == Status.error
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              widget.bloc.add(GetDepartmentEvent());
                            },
                            child: Stack(
                              children: [
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.refresh),
                                      Text(
                                        state.errorMessageMarket ?? "Xatolik",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        : state.statusDepartment == Status.success
                        ? Column(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: false,
                                enlargeCenterPage: true,
                                viewportFraction: 0.9,
                                aspectRatio: 2.0,
                                height: 170,
                                autoPlayAnimationDuration: const Duration(
                                  milliseconds: 800,
                                ),
                                initialPage: 0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    bloc.add(
                                      GetDepartmentHeaderEvent(
                                        marketTypeId:
                                            state.departmentData?[index].id,
                                      ),
                                    );
                                    _current = index;
                                    widget.currentIndex(
                                      state.departmentData?[index].id ?? "",
                                    );
                                  });
                                },
                              ),
                              items:
                                  state.departmentData?.map((department) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(
                                            // horizontal: 4,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.backGround,
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.08,
                                                ),
                                                blurRadius: 10,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: SvgPicture.network(
                                                  department.image ?? "",
                                                  height: 140,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) {
                                                    return Container(
                                                      height: 140,
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors
                                                                .teal
                                                                .shade100,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                              bottomRight:
                                                                  Radius.circular(
                                                                    16,
                                                                  ),
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              // Title
                                              Positioned(
                                                top: 20,
                                                left: 20,
                                                child: Text(
                                                  department.titleUz ?? "",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.black,
                                                  ),
                                                ),
                                              ),
                                              // Logo
                                              Positioned(
                                                bottom: 16,
                                                left: 16,
                                                child: SvgPicture.asset(
                                                  AppIcons.logo,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                            ),
                            10.vertical,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  (state.departmentData ?? [])
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                        return AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          width:
                                              _current == entry.key ? 42 : 10,
                                          height: 4,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            color:
                                                _current == entry.key
                                                    ? AppColors.primaryColor
                                                    : CupertinoColors
                                                        .systemGrey5,
                                          ),
                                        );
                                      })
                                      .toList(),
                            ),
                            10.vertical,

                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "all_market_number".tr(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          state2.data?.totalMarkets
                                                  .toString() ??
                                              "",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    6.vertical,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "total_costs".tr(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            return Text(
                                              PriceFormatterService.formatPrice(
                                                state2.data?.totalSpent
                                                        .toString() ??
                                                    "",
                                              ),
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    6.vertical,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "monthly_market".tr(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            return Text(
                                              state2.data?.monthlyMarkets
                                                      .toString() ??
                                                  "",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    6.vertical,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "monthly_expenses".tr(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            return Text(
                                              PriceFormatterService.formatPrice(
                                                state2.data?.monthlySpent
                                                        .toString() ??
                                                    "",
                                              ),
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    6.vertical,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ratio_month".tr(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            return Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppIcons.arrowGreen,
                                                ),
                                                10.horizontal,
                                                Text(
                                                  state2.data?.compareToPrevMonth.toString()??"",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        : SizedBox(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DiagonalLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    const spacing = 20.0;
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
