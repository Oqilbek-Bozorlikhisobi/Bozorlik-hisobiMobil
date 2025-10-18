class PriceFormatterService {
  static String formatPrice(String price) {
    if (price.trim().isEmpty) return '0';

    final cleaned = price.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleaned.isEmpty) return '0';

    final number = int.parse(cleaned);

    final regExp = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return number.toString().replaceAllMapped(regExp, (match) => ' ');
  }
}
