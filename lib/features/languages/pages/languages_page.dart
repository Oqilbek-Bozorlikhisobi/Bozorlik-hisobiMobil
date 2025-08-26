import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router.dart';
import '../notifiers/language_notifier.dart';

class LanguagesPage extends ConsumerWidget {
  const LanguagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageNotifierProvider);

    final languageNotifier = ref.watch(languageNotifierProvider.notifier);
    ref.listen(languageNotifierProvider, (previous, next) {
      if (next != null) {
        context.go(AppRoutes.splash);
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Center(
                child: SvgPicture.asset(AppIcons.logo, height: 150, width: 150),
              ),
              20.vertical,
              Text(
                "select_app_language".tr(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              8.vertical,
              Text(
                "change_language_anytime".tr(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 3),
              CustomButton(
                text: "O'zbek",
                onTap: () {
                  languageNotifier.changeLanguage("uz", context);
                },
              ),
              10.vertical,
              CustomButton(
                text: "English",
                onTap: () {
                  languageNotifier.changeLanguage("en", context);
                },
              ),
              10.vertical,
              CustomButton(
                text: "Русский",
                onTap: () {
                  languageNotifier.changeLanguage("ru", context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
