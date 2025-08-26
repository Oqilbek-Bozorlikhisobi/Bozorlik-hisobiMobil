import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/for_context.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/db/cache.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/repositories/auth_repository.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentPage = useState(0);
    void onPageChanged(int page) {
      currentPage.value = page;
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primaryColorOpacity,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 4,
                width: currentPage.value == index ? 56 : 25,
                decoration: BoxDecoration(
                  color:
                      currentPage.value == index
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ),
        leading:
            currentPage.value > 0
                ? IconButton(
                  onPressed: () {
                    if (currentPage.value == 1) {
                      pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    } else if (currentPage.value == 2) {
                      pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                  },
                  icon: SvgPicture.asset(AppIcons.back),
                )
                : null,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: onPageChanged,
              controller: pageController,
              children: [
                Image.asset(
                  context.localizedTitle(
                        AppImages.banner1uz,
                        AppImages.banner1ru,
                        AppImages.banner1en,
                      ) ??
                      AppImages.banner1uz,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  context.localizedTitle(
                        AppImages.banner2uz,
                        AppImages.banner2ru,
                        AppImages.banner2en,
                      ) ??
                      AppImages.banner2uz,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  context.localizedTitle(
                        AppImages.banner3uz,
                        AppImages.banner3ru,
                        AppImages.banner3en,
                      ) ??
                      AppImages.banner3uz,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          // White gradient at top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 140,
            // adjust as you like
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black45, Colors.transparent],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 12,
            right: 12,
            child: CustomButton(
              text: "next".tr(),
              onTap: () async {
                if (currentPage.value == 0) {
                  pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                } else if (currentPage.value == 1) {
                  pageController.animateToPage(
                    2,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                } else {
                  await cache.setBool("onboarded", true);
                  authRepository.initialRoute(ref).then((route) {
                    if (context.mounted) {
                      context.go(route);
                    }
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
