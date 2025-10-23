// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// final languageNotifierProvider = StateNotifierProvider<LanguageNotifier, String?>((ref) {
//   return LanguageNotifier();
// });
//
// class LanguageNotifier extends StateNotifier<String?> {
//   LanguageNotifier() : super(null);
//
//   Future<void> changeLanguage(String langCode, BuildContext context) async {
//     try {
//       Locale locale;
//
//       switch (langCode) {
//         case 'cyrillic':
//           locale = Locale('uz', 'cyrillic');
//           break;
//         case 'uz':
//           locale = Locale('uz');
//           break;
//         case 'ru':
//           locale = Locale('ru');
//           break;
//         case 'en':
//           locale = Locale('en');
//           break;
//         default:
//           locale = Locale('uz');
//       }
//
//       await context.setLocale(locale);
//       state = langCode;
//       print('✅ Til ўзгартирилди: $langCode -> $locale');
//     } catch (e) {
//       print('❌ Localization xatolik: $e');
//       state = null;
//     }
//   }
// }