import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/features/home/bloc/home_bloc.dart';
import 'package:bozorlik/features/home/widgets/banners_widget.dart';
import 'package:bozorlik/features/home/widgets/create_market_bottomsheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../categories/widgets/cart_create_modal.dart';
import '../widgets/department_card.dart';
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

  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
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
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                    child: Transform.scale(scale: 0.5, child: SvgPicture.asset(AppIcons.search)),
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.search);
                  },
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                    child: Padding(padding: EdgeInsets.all(8.0), child: SvgPicture.asset(AppIcons.notification)),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            body: ListView(
              children: [
                16.vertical,
                OnboardingBanner(bloc: bloc,),
                DepartmentCard(bloc: bloc,),
                4.vertical,
                Shoppings(bloc: bloc,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    rightW: SizedBox(),
                    text: "new_market".tr(),
                    onTap: () {
                      showCreateMarketCart(context);
                    },
                    rightIcon: Container(
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5)),
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
