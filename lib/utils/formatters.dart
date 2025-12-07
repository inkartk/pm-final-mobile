import 'package:intl/intl.dart';

class AppFormatters {
  static String formatPrice(double price) {
    final formatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );
    return formatter.format(price);
  }

  static String formatPriceCustom(double price, int decimalPlaces) {
    final formatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: decimalPlaces,
    );
    return formatter.format(price);
  }

  static String formatPercent(double value) {
    final percentage = (value * 100).toInt();
    return '$percentage%';
  }

  static String formatPercentDecimal(double value, int decimalPlaces) {
    final percentage = (value * 100).toStringAsFixed(decimalPlaces);
    return '$percentage%';
  }

  static String formatDateTime(DateTime dateTime) {
    final localTime = dateTime.toLocal();
    final formatter = DateFormat('MMM dd, yyyy HH:mm:ss');
    return formatter.format(localTime);
  }

  static String formatTime(DateTime dateTime) {
    final localTime = dateTime.toLocal();
    final formatter = DateFormat('HH:mm:ss');
    return formatter.format(localTime);
  }


  static String formatDate(DateTime dateTime) {
    final localTime = dateTime.toLocal();
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(localTime);
  }


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

  static String formatNumber(double number) {
    final formatter = NumberFormat('#,###.##');
    return formatter.format(number);
  }

  static String formatNumberCompact(double number) {
    final formatter = NumberFormat.compact();
    return formatter.format(number);
  }

  static String formatOrderId(String orderId) {
    if (orderId.length <= 12) return orderId;
    return '${orderId.substring(0, 6)}...${orderId.substring(orderId.length - 6)}';
  }

  static String formatIndicator(double value) {
    return value.toStringAsFixed(2);
  }

  static String formatConfidence(double confidence) {
    final percentage = (confidence * 100).toStringAsFixed(1);
    return '$percentage%';
  }
}
