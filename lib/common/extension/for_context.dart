import 'package:flutter/cupertino.dart';

extension ForContext on BuildContext {
  String get langCode => Localizations.localeOf(this).languageCode;

  String? localizedTitle(String? uz, String? ru, String? en) {
    switch (langCode) {
      case "en":
        return en;
      case "ru":
        return ru;
      case "uz":
        return uz;
    }
    return uz;
  }
}
