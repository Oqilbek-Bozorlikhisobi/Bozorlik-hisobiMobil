import 'package:intl/intl.dart';

String formatDate(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate);
  return DateFormat('dd.MM.yyyy').format(dateTime);
}

String formatDate2(String isoDate) {
  DateTime date = DateTime.parse(isoDate).toLocal();

  final formatted = DateFormat("MMMM d, y 'at' h:mm a").format(date);

  return formatted;
}

