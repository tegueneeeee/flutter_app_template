import 'dart:math' as math;

import 'package:intl/intl.dart';

/// A collection of utility functions for formatting various data types
class FormatUtils {
  FormatUtils._();

  // Currency formatters
  static final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );

  static final NumberFormat _compactCurrencyFormat =
      NumberFormat.compactCurrency(locale: 'en_US', symbol: '\$');

  // Number formatters
  static final NumberFormat _numberFormat = NumberFormat.decimalPattern();
  static final NumberFormat _compactNumberFormat = NumberFormat.compact();
  static final NumberFormat _percentFormat = NumberFormat.percentPattern();

  /// Format a number as currency (e.g., $1,234.56)
  static String formatCurrency(num value) {
    return _currencyFormat.format(value);
  }

  /// Format a currency with a custom symbol and locale
  static String formatCurrencyCustom(
    num value, {
    required String symbol,
    String locale = 'en_US',
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );
    return formatter.format(value);
  }

  /// Format a large currency value in a compact form (e.g., $1.2M)
  static String formatCompactCurrency(num value) {
    return _compactCurrencyFormat.format(value);
  }

  /// Format a number with thousand separators (e.g., 1,234.56)
  static String formatNumber(num value) {
    return _numberFormat.format(value);
  }

  /// Format a large number in a compact form (e.g., 1.2M)
  static String formatCompactNumber(num value) {
    return _compactNumberFormat.format(value);
  }

  /// Format a number as a percentage (e.g., 0.12 -> 12%)
  static String formatPercent(num value) {
    return _percentFormat.format(value);
  }

  /// Format bytes into a human-readable form (e.g., 1.5 MB)
  static String formatBytes(int bytes, {int decimals = 1}) {
    if (bytes <= 0) return '0 B';

    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final i = (log(bytes) / log(1024)).floor();

    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// Format a duration in milliseconds to a readable time (e.g., 01:23:45)
  static String formatDuration(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  /// Format a phone number in a readable format (e.g., (123) 456-7890)
  static String formatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 10) {
      return phoneNumber; // Return original if not enough digits
    }

    // US format: (xxx) xxx-xxxx
    if (digitsOnly.length == 10) {
      return '(${digitsOnly.substring(0, 3)}) ${digitsOnly.substring(3, 6)}-${digitsOnly.substring(6)}';
    }

    // International format: +x (xxx) xxx-xxxx
    if (digitsOnly.length > 10) {
      final countryCode = digitsOnly.substring(0, digitsOnly.length - 10);
      final areaCode = digitsOnly.substring(
        digitsOnly.length - 10,
        digitsOnly.length - 7,
      );
      final firstPart = digitsOnly.substring(
        digitsOnly.length - 7,
        digitsOnly.length - 4,
      );
      final lastPart = digitsOnly.substring(digitsOnly.length - 4);

      return '+$countryCode ($areaCode) $firstPart-$lastPart';
    }

    return phoneNumber;
  }

  /// Format a credit card number with proper spacing and masking
  static String formatCreditCardNumber(
    String cardNumber, {
    bool masked = true,
  }) {
    // Remove all non-digit characters
    final digitsOnly = cardNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.isEmpty) return cardNumber;

    // Add spaces every 4 digits
    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i += 4) {
      final end = i + 4 > digitsOnly.length ? digitsOnly.length : i + 4;
      final chunk = digitsOnly.substring(i, end);

      // Mask all digits except the last 4
      final maskedChunk = masked && i < digitsOnly.length - 4 ? 'XXXX' : chunk;

      buffer.write(maskedChunk);

      if (end < digitsOnly.length) {
        buffer.write(' ');
      }
    }

    return buffer.toString();
  }

  /// Format a name to capitalize first letters (e.g., john doe -> John Doe)
  static String formatName(String name) {
    if (name.isEmpty) return name;

    return name
        .split(' ')
        .map((part) {
          if (part.isEmpty) return part;
          return part[0].toUpperCase() + part.substring(1).toLowerCase();
        })
        .join(' ');
  }
}

/// Extension methods for double to easily use formatters
extension FormatExtensionOnDouble on double {
  String get asCurrency => FormatUtils.formatCurrency(this);
  String get asCompactCurrency => FormatUtils.formatCompactCurrency(this);
  String get asPercent => FormatUtils.formatPercent(this);
  String get asNumber => FormatUtils.formatNumber(this);
  String get asCompactNumber => FormatUtils.formatCompactNumber(this);
}

/// Extension methods for int to easily use formatters
extension FormatExtensionOnInt on int {
  String get asCurrency => FormatUtils.formatCurrency(this);
  String get asCompactCurrency => FormatUtils.formatCompactCurrency(this);
  String get asPercent => FormatUtils.formatPercent(this);
  String get asNumber => FormatUtils.formatNumber(this);
  String get asCompactNumber => FormatUtils.formatCompactNumber(this);
  String get asBytes => FormatUtils.formatBytes(this);
  String get asDuration => FormatUtils.formatDuration(this);
}

/// Mathematical helper functions
double log(num x, [num? base]) {
  if (base == null) {
    return x.toDouble() <= 0 ? 0 : x.log;
  } else {
    return x.toDouble() <= 0 ? 0 : (x.log / base.log);
  }
}

double pow(num x, num exponent) {
  return x.pow(exponent).toDouble();
}

/// Extension method to add the pow function to num
extension NumPow on num {
  double pow(num exponent) {
    return (this <= 0 && exponent < 0)
        ? 0
        : math.pow(this, exponent).toDouble();
  }

  double get log => math.log(this).toDouble();
}
