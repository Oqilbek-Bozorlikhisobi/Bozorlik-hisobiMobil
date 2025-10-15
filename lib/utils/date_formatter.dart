import 'package:intl/intl.dart';

String formatDate(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate);
  return DateFormat('dd.MM.yyyy').format(dateTime);
}

