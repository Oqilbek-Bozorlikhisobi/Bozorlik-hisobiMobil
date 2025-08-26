import 'package:bozorlik/db/cache.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_notifier.g.dart';

@riverpod
class LanguageNotifier extends _$LanguageNotifier {
  @override
  String? build() {
    return currentLanguage();
  }

  String? currentLanguage() {
    return cache.getString("language");
  }

  Future<String> changeLanguage(String language, BuildContext context) async {

    await context.setLocale(Locale(language));
    await cache.setString("language", language);
    state = language;
    return language;
  }
}
