import 'package:easy_localization/easy_localization.dart';

extension DatetimeExtension on DateTime {
  String formatDate() {
    try {
      return DateFormat('yyyy.MM.dd').format(this);
    } catch (e, s) {}
    return "";
  }
}
