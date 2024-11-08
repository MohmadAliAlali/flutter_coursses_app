class Helpers {
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }
}