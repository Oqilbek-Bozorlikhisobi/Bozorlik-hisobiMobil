import 'package:bozorlik/features/cart/pages/cart_page.dart';
import 'package:bozorlik/features/categories/pages/categories_page.dart';
import 'package:bozorlik/features/history/pages/history_page.dart';
import 'package:bozorlik/features/home/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/theme.dart';
import '../../../common/values/app_assets.dart';
import '../../cart/notifiers/all_carts_notifier.dart';
import '../../cart/notifiers/cart_notifier.dart';
import '../../settings/notifiers/profile_notifier.dart';
import '../../settings/pages/settings_page.dart';
import '../notifiers/index_notifier.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexNotifierProvider);
    final controller = usePageController(initialPage: currentIndex);
    final cart = ref.watch(cartNotifierProvider);
    final carts = ref.watch(allCartsNotifierProvider);
    final profile = ref.watch(profileNotifierProvider);

    ref.listen(indexNotifierProvider, (previous, next) {
      controller.jumpToPage(next);
    });
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomePage(),
          CategoriesPage(),
          CartPage(),
          HistoryPage(),
          SettingsPage(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black12, blurRadius: 5),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 10,

            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            unselectedItemColor: AppColors.grayNormal,
            selectedItemColor: AppColors.primaryColor,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: (index) {
              ref.read(indexNotifierProvider.notifier).changeIndex(index);
            },
            items: [
              buildBottomNavigationBarItem(
                iconPath: AppIcons.home,
                label: "main".tr(),
                isActive: currentIndex == 0,
              ),
              buildBottomNavigationBarItem(
                iconPath: AppIcons.main,
                label: "categories".tr(),
                isActive: currentIndex == 1,
              ),
              buildBottomNavigationBarItem(
                iconPath: AppIcons.cart,
                label: "cart".tr(),
                badgeCount: cart.valueOrNull?.marketLists?.length ?? 0,
                isActive: currentIndex == 2,
              ),
              buildBottomNavigationBarItem(
                iconPath: AppIcons.history,
                label: "history".tr(),
                isActive: currentIndex == 3,
              ),
              buildBottomNavigationBarItem(
                iconPath: AppIcons.settings,
                label: "settings".tr(),
                isActive: currentIndex == 4,
              ),
              // buildBottomNavigationBarItem(
              //   iconPath: AppIcons.main,
              //   label: "Sozlamalar",
              //   isActive: currentIndex == 3,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String iconPath,
    required String label,
    required bool isActive,
    int? badgeCount,
  }) {
    {
      return BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration:
              isActive
                  ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColorOpacity,
                  )
                  : null,
          child: Badge(
            isLabelVisible: badgeCount != null && badgeCount > 0,
            label: Text(badgeCount.toString()),
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter:
                  isActive
                      ? ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      )
                      : null,
            ),
          ),
        ),
        label: label,
      );
    }
  }
}
