import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
String getUnformattedValue(String text) {
  return text.replaceAll(' ', '');
}
// Formatter klassi
class NumberFormatter extends TextInputFormatter {
  final NumberFormat formatter = NumberFormat('#,###', 'en_US');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Faqat raqamlarni olish
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue();
    }

    // Formatlash
    int value = int.parse(digitsOnly);
    String formatted = formatter.format(value).replaceAll(',', ' ');

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
