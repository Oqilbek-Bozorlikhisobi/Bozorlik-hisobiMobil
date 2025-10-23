import 'package:bozorlik/features/cart/pages/cart_page.dart';
import 'package:bozorlik/features/categories/pages/categories_page.dart';
import 'package:bozorlik/features/history/pages/history_new.dart';
import 'package:bozorlik/features/home/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/theme.dart';
import '../../../common/values/app_assets.dart';
import '../../cart/notifiers/cart_notifier.dart';
import '../../settings/pages/settings_page.dart';
import '../notifiers/index_notifier.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexNotifierProvider);
    final controller = usePageController(initialPage: currentIndex);
    final cart = ref.watch(cartNotifierProvider);
    // final carts = ref.watch(allCartsNotifierProvider);
    // final profile = ref.watch(profileNotifierProvider);

    ref.listen(indexNotifierProvider, (previous, next) {
      controller.jumpToPage(next);
    });
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [HomePage(), CategoriesPage(), CartPage(), HistoryNew(), SettingsPage()],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent, hoverColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
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
                iconPath: currentIndex == 0 ? AppIcons.homeFilled : AppIcons.home,
                label: "main".tr(),
                isActive: currentIndex == 0,
              ),
              buildBottomNavigationBarItem(
                iconPath: currentIndex == 1 ? AppIcons.mainFilled : AppIcons.main,
                label: "categories".tr(),
                isActive: currentIndex == 1,
              ),
              buildBottomNavigationBarItem(
                iconPath: currentIndex == 2 ? AppIcons.cartFilled : AppIcons.cart,
                label: "cart".tr(),
                badgeCount: cart.valueOrNull?.marketLists?.length ?? 0,
                isActive: currentIndex == 2,
              ),
              buildBottomNavigationBarItem(
                iconPath: currentIndex == 3 ? AppIcons.historyFilled : AppIcons.history,
                label: "history".tr(),
                isActive: currentIndex == 3,
              ),
              buildBottomNavigationBarItem(
                iconPath: currentIndex == 4 ? AppIcons.mainFilled : AppIcons.main,
                label: "menu".tr(),
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

  BottomNavigationBarItem buildBottomNavigationBarItem({required String iconPath, required String label, required bool isActive, int? badgeCount}) {
    {
      return BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration: isActive ? BoxDecoration(borderRadius: BorderRadius.circular(10)) : null,
          child: Badge(
            isLabelVisible: false,
            label: Text(badgeCount.toString()),
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter: isActive ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn) : null,
            ),
          ),
        ),
        label: label,
      );
    }
  }
}
