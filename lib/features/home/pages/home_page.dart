import 'dart:io';

import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/features/home/pages/screens/notification.dart';
import 'package:bozorlik/features/home/widgets/banners_widget.dart';
import 'package:bozorlik/features/home/widgets/create_market_bottomsheet.dart';
import 'package:bozorlik/features/home/widgets/department_card.dart';
import 'package:bozorlik/utils/enums.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/shoppings_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(GetMarketabilityEvent());
    bloc.add(GetDepartmentEvent());
    bloc.add(GetBannerEvent());
    bloc.add(GetVersionEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Future<void> _showUpdateDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                    "store_check_new".tr(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                   Text(
                    "store_check".tr(),
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: () async {
                      _openStore();
                      // if (urlStore != null) {
                      //   await launchUrl(
                      //     Uri.parse(urlStore!),
                      //     mode: LaunchMode.externalApplication,
                      //   );
                      // }
                    },
                    text: "Yangilash",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _openStore() async {
    const String playStoreUrl =
        'https://play.google.com/store/apps/details?id=uz.bozorlik.app&pcampaignid=web_share';
    const String appStoreUrl =
        'https://apps.apple.com/uz/app/bozor-app/id6751641500';

    final Uri url = Uri.parse(Platform.isIOS ? appStoreUrl : playStoreUrl);

    if (!await launchUrl(
      url,
      mode:
          LaunchMode
              .externalApplication,
    )) {
      throw Exception('Store linkni ochib bo‘lmadi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if(state.statusCheck==Status.success){
            // _showUpdateDialog();
          }

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backGround,

            appBar: AppBar(
              backgroundColor: AppColors.backGround,
              leading: Transform.scale(
                scale: 0.7,
                child: GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.search);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          context.isDarkMode
                              ? AppColors.textPrimary
                              : AppColors.white,
                    ),
                    child: Transform.scale(
                      scale: 0.5,
                      child: SvgPicture.asset(AppIcons.search),
                    ),
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => NotificationScreen(),
                      ),
                    );
                    // context.push(AppRoutes.search);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          context.isDarkMode
                              ? AppColors.textPrimary
                              : AppColors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppIcons.notification),
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            body: ListView(
              children: [
                16.vertical,
                OnboardingBanner(bloc: bloc),
                DepartmentCard(bloc: bloc),
                4.vertical,
                Shoppings(bloc: bloc),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    rightW: SizedBox(),
                    text: "new_market".tr(),
                    onTap: () {
                      showCreateMarketCart(context);
                    },
                    rightIcon: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(Icons.add, color: AppColors.primaryColor),
                    ),
                  ),
                ),
                16.vertical,
              ],
            ),
          );
        },
      ),
    );
  }
}

// class HomePage extends HookConsumerWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final focusNode = useFocusNode();
//     return Scaffold(
//       backgroundColor: AppColors.backGround,
//
//       appBar: AppBar(
//         backgroundColor: AppColors.backGround,
//         leading: Transform.scale(
//           scale: 0.7,
//           child: GestureDetector(
//             onTap: () {
//               focusNode.unfocus();
//               context.push(AppRoutes.search);
//             },
//             child: Container(
//               decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
//               child: Transform.scale(scale: 0.5, child: SvgPicture.asset(AppIcons.search)),
//             ),
//           ),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               focusNode.unfocus();
//               context.push(AppRoutes.search);
//             },
//             child: Container(
//               decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
//               child: Padding(padding: EdgeInsets.all(8.0), child: SvgPicture.asset(AppIcons.notification)),
//             ),
//           ),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: ListView(
//         children: [
//           16.vertical,
//           const BannersWidget(),
//           DepartmentCard(),
//           4.vertical,
//           Shoppings(),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: CustomButton(
//               rightW: SizedBox(),
//               text: "new_market".tr(),
//               onTap: () {
//                 showCreateMarketCart(context);
//
//               },
//               rightIcon: Container(
//                 decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5)),
//                 child: Icon(Icons.add, color: AppColors.primaryColor),
//               ),
//             ),
//           ),
//           16.vertical,
//         ],
//       ),
//     );
//   }
// }
