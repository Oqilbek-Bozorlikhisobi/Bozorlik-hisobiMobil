class PriceFormatterService {
  static String formatPrice(String price) {
    if (price.trim().isEmpty) return '0';

    // Agar nuqta bo'lsa, nuqtadan oldingi qismni olish
    String processedPrice = price;
    if (price.contains('.')) {
      processedPrice = price.split('.')[0];
    }

    final cleaned = processedPrice.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleaned.isEmpty) return '0';

    final number = int.parse(cleaned);

    final formatted = number.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match.group(1)} ',
    );

    return formatted;
  }
}