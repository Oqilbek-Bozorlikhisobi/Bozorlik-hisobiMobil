// import 'package:bozorlik/common/extension/number_extension.dart';
// import 'package:bozorlik/common/values/app_assets.dart';
// import 'package:bozorlik/common/widgets/custom_button.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../../app/router.dart';
// import '../notifiers/language_notifier.dart';
//
// class LanguagesPage extends ConsumerWidget {
//   const LanguagesPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final language = ref.watch(languageNotifierProvider);
//
//     final languageNotifier = ref.watch(languageNotifierProvider.notifier);
//     ref.listen(languageNotifierProvider, (previous, next) {
//       if (next != null) {
//         context.go(AppRoutes.splash);
//       }
//     });
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Spacer(flex: 2),
//               Center(
//                 child: Image.asset(AppImages.logo, height: 150, width: 150),
//               ),
//               20.vertical,
//               Text(
//                 "select_app_language".tr(),
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//               ),
//               8.vertical,
//               Text(
//                 "change_language_anytime".tr(),
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w300,
//                   color: Colors.grey.shade600,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Spacer(flex: 3),
//               CustomButton(
//                 text: "O'zbek",
//                 onTap: () {
//                   languageNotifier.changeLanguage("uz", context);
//                 },
//               ),
//               10.vertical,
//               CustomButton(
//                 text: "English",
//                 onTap: () {
//                   languageNotifier.changeLanguage("en", context);
//                 },
//               ),
//               10.vertical,
//               CustomButton(
//                 text: "Русский",
//                 onTap: () {
//                   languageNotifier.changeLanguage("ru", context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:bozorlik/common/values/app_assets.dart';
import 'package:bozorlik/common/widgets/custom_button.dart';
import 'package:bozorlik/db/cache.dart';
import 'package:bozorlik/features/onboarding/pages/splash_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router.dart';
import '../notifiers/language_notifier.dart';

class LanguagesPage extends ConsumerStatefulWidget {
  const LanguagesPage({super.key});

  @override
  ConsumerState<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends ConsumerState<LanguagesPage> {
  String selectedLanguage = 'uz';

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // final languageNotifier = ref.watch(languageNotifierProvider.notifier);
    //
    // ref.listen(languageNotifierProvider, (previous, next) {
    //   // if (next != null) {
    //   Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>SplashPage()));
    //     context.go(AppRoutes.splash);
    //
    //     setState(() {
    //
    //     });
    //   // }
    // });

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(backgroundColor: Colors.grey.shade50, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.vertical,
              Text(
                "Qaysi tilda davom etamiz?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              8.vertical,
              Text(
                "Ilimos o'zingizga qulay tilni tanlang",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              30.vertical,
              _LanguageTile(
                flag: '🇺🇿',
                language: "O'zbekcha",
                isSelected: selectedLanguage == 'uz',
                onTap: () {
                  setState(() {
                    selectedLanguage = 'uz';
                  });
                },
              ),
              12.vertical,
              _LanguageTile(
                flag: '🇺🇿',
                language: "Ўзбекча",
                isSelected: selectedLanguage == 'ky',
                onTap: () {
                  setState(() {
                    selectedLanguage = 'ky';
                  });
                },
              ),
              12.vertical,
              _LanguageTile(
                flag: '🇬🇧',
                language: "English",
                isSelected: selectedLanguage == 'en',
                onTap: () {
                  setState(() {
                    selectedLanguage = 'en';
                  });
                },
              ),
              12.vertical,
              _LanguageTile(
                flag: '🇷🇺',
                language: "Русский",
                isSelected: selectedLanguage == 'ru',
                onTap: () {
                  setState(() {
                    selectedLanguage = 'ru';
                  });
                },
              ),
              Spacer(),
              CustomButton(
                text: "Davom etish",
                onTap: () {
                  String langCode = selectedLanguage;
                  // if (selectedLanguage == 'uz_cyrillic') {
                  //   langCode = 'uz';
                  // }
                  changeLanguage(langCode, context);
                  // var languageNotifier = LanguageNotifier();
                  // languageNotifier.changeLanguage(selectedLanguage, context);
                  // context.go(AppRoutes.splash);

                },
              ),
              20.vertical,
            ],
          ),
        ),
      ),
    );
  }

  Future<String> changeLanguage(String language, BuildContext context) async {
    try {
      Locale locale;

      // Language code-ni Locale-ga aylantirish
      switch (language) {
        case 'ky':
          locale = Locale("ky");
          break;
        case 'uz':
          locale = Locale('uz');
          break;
        case 'ru':
          locale = Locale('ru');
          break;
        case 'en':
          locale = Locale('en');
          break;
        default:
          locale = Locale('uz');
      }

      // Tilni o'zgartirish
      await context.setLocale(locale);

      // Cache-ga saqlash
      await cache.setString("language", language);

      // State-ni yangilash
      selectedLanguage = language;
      // Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>SplashPage()));
      context.go(AppRoutes.splash);
      print("✅ Til muvaffaqiyatli o'zgartirildi: $language");
      return language;
    } catch (e) {
      print('❌ Tilni ўзгартirish xatolik: $e');
      rethrow;
    }
  }

}

class _LanguageTile extends StatelessWidget {
  final String flag;
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageTile({required this.flag, required this.language, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primaryColor : Colors.grey.shade200, width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Center(child: Text(flag, style: TextStyle(fontSize: 24))),
            ),
            HorizontalSpacing(16).horizontal,
            Text(language, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87)),
            Spacer(),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                child: Icon(Icons.check, color: Colors.white, size: 16),
              ),
          ],
        ),
      ),
    );
  }
}

extension HorizontalSpacing on num {
  Widget get horizontal => SizedBox(width: toDouble());
}
