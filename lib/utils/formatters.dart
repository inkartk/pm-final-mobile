import 'package:intl/intl.dart';

class AppFormatters {
  // Price Formatter - formats as currency with 2 decimal places
  static String formatPrice(double price) {
    final formatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );
    return formatter.format(price);
  }

  // Price Formatter with custom decimal places
  static String formatPriceCustom(double price, int decimalPlaces) {
    final formatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: decimalPlaces,
    );
    return formatter.format(price);
  }

  // Percent Formatter - formats as percentage (0.84 -> 84%)
  static String formatPercent(double value) {
    final percentage = (value * 100).toInt();
    return '$percentage%';
  }

  // Percent Formatter with decimal - formats as percentage (0.8456 -> 84.56%)
  static String formatPercentDecimal(double value, int decimalPlaces) {
    final percentage = (value * 100).toStringAsFixed(decimalPlaces);
    return '$percentage%';
  }

  // Date/Time Formatter - formats DateTime as readable string
  // Converts UTC to local time before formatting
  static String formatDateTime(DateTime dateTime) {
    final localTime = dateTime.toLocal();
    final formatter = DateFormat('MMM dd, yyyy HH:mm:ss');
    return formatter.format(localTime);
  }

  // Time Only Formatter - formats DateTime as time only
  // Converts UTC to local time before formatting
  static String formatTime(DateTime dateTime) {
    final localTime = dateTime.toLocal();
    final formatter = DateFormat('HH:mm:ss');
    return formatter.format(localTime);
  }

  // Date Only Formatter - formats DateTime as date only
  // Converts UTC to local time before formatting
  static String formatDate(DateTime dateTime) {
    final localTime = dateTime.toLocal();
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(localTime);
  }

  // Relative Time Formatter - formats as "5 minutes ago", "2 hours ago", etc.
  // Converts UTC to local time before calculating difference
  static String formatRelativeTime(DateTime dateTime) {
    final localTime = dateTime.toLocal();
    final now = DateTime.now();
    final difference = now.difference(localTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return formatDate(localTime);
    }
  }

  // Number Formatter - formats large numbers with commas
  static String formatNumber(double number) {
    final formatter = NumberFormat('#,###.##');
    return formatter.format(number);
  }

  // Compact Number Formatter - formats large numbers compactly (1000 -> 1K)
  static String formatNumberCompact(double number) {
    final formatter = NumberFormat.compact();
    return formatter.format(number);
  }

  // Order ID Formatter - shortens order ID for display
  static String formatOrderId(String orderId) {
    if (orderId.length <= 12) return orderId;
    return '${orderId.substring(0, 6)}...${orderId.substring(orderId.length - 6)}';
  }

  // Indicator Formatter - formats technical indicator values
  static String formatIndicator(double value) {
    return value.toStringAsFixed(2);
  }

  // Confidence Formatter - formats confidence as percentage with 1 decimal
  static String formatConfidence(double confidence) {
    final percentage = (confidence * 100).toStringAsFixed(1);
    return '$percentage%';
  }
}
