// import 'package:bozorlik/db/cache.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'language_notifier.g.dart';
//
// @riverpod
// class LanguageNotifier extends _$LanguageNotifier {
//   @override
//   String? build() {
//     return currentLanguage();
//   }
//
//   String? currentLanguage() {
//     return cache.getString("language");
//   }
//
//   Future<String> changeLanguage(String language, BuildContext context) async {
//
//     await context.setLocale(Locale(language));
//     await cache.setString("language", language);
//     state = language;
//     return language;
//   }
// }
import 'package:bozorlik/db/cache.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_notifier.g.dart';

@riverpod
class LanguageNotifier extends _$LanguageNotifier {
  @override
  String? build() {
    return currentLanguage();
  }

  String? currentLanguage() {
    return cache.getString("language") ?? 'uz';
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
      state = language;

      print('✅ Til muvaffaqiyatli ўзгартирилди: $language');
      return language;
    } catch (e) {
      print('❌ Tilni ўзгартirish xatolik: $e');
      rethrow;
    }
  }
}