import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/loading_widget.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/features/home/pages/screens/department_screen.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DepartmentCard extends StatefulWidget {
  const DepartmentCard({super.key, required this.bloc});

  final HomeBloc bloc;

  @override
  State<DepartmentCard> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DepartmentScreen()));
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.white),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => DepartmentScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("department".tr(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: context.isDarkMode ? AppColors.textPrimary : AppColors.grey.withOpacity(0.2),
                          ),
                          child: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.black, size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 178,
                  child:
                      state.statusDepartment == Status.loading
                          ? LoadingWidget()
                          : state.statusDepartment == Status.error
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
                          : state.statusDepartment == Status.success
                          ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            itemCount: state.departmentData?.length,
                            itemBuilder: (context, index) {
                              final department = state.departmentData?[index];
                              return Container(
                                width: 280,
                                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.backGround,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: Offset(0, 2))],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: SvgPicture.network(
                                        department?.image ?? "",
                                        height: 140,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            height: 140,
                                            width: 140,
                                            decoration: BoxDecoration(
                                              color: Colors.teal.shade100,
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    // Title
                                    Positioned(
                                      top: 20,
                                      left: 20,
                                      child: Builder(
                                        builder: (context) {
                                          final currentLocale = context.locale.languageCode;

                                          // Tilga qarab title-ni tanlash
                                          String getTitle() {
                                            switch (currentLocale) {
                                              case 'uz':
                                                return department?.titleUz ?? "";
                                              case 'ky':
                                                return department?.titleUzk ?? "";
                                              case 'ru':
                                                return department?.titleRu ?? "";
                                              case 'en':
                                                return department?.titleEn ?? "";
                                              default:
                                                return department?.titleUz ?? "";
                                            }
                                          }

                                          return Text(
                                            getTitle(),
                                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                                          );
                                        },
                                      ),
                                    ),
                                    // Logo
                                    Positioned(bottom: 16, left: 16, child: SvgPicture.asset(context.isDarkMode ? AppIcons.logoDark : AppIcons.logo)),
                                  ],
                                ),
                              );
                            },
                          )
                          : state.statusDepartment == Status.empty
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
      ),
    );
  }
}

class DepartmentItem {
  final String title;
  final String image;

  DepartmentItem({required this.title, required this.image});
}
