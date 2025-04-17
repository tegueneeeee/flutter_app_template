import 'dart:math' as math;

/// Extension methods for num class
extension NumExtensions on num {
  /// Convert milliseconds to Duration
  Duration get ms => Duration(milliseconds: toInt());

  /// Convert seconds to Duration
  Duration get seconds => Duration(seconds: toInt());

  /// Convert minutes to Duration
  Duration get minutes => Duration(minutes: toInt());

  /// Convert hours to Duration
  Duration get hours => Duration(hours: toInt());

  /// Convert days to Duration
  Duration get days => Duration(days: toInt());

  /// Delay execution for the specified duration
  Future<void> get delay => Future.delayed(ms);

  /// Format the number as currency with $ sign
  String toCurrency({String symbol = '\$', int decimalPlaces = 2}) {
    return '$symbol${toStringAsFixed(decimalPlaces)}';
  }

  /// Format the number as a percentage
  String toPercentage({int decimalPlaces = 0}) {
    return '${toStringAsFixed(decimalPlaces)}%';
  }

  /// Return the value clamped to the given range
  num clamp(num min, num max) {
    return math.min(math.max(this, min), max);
  }

  /// Return the value or the min value if the value is less than min
  num atLeast(num min) {
    return this < min ? min : this;
  }

  /// Return the value or the max value if the value is greater than max
  num atMost(num max) {
    return this > max ? max : this;
  }

  /// Check if the value is between min and max inclusive
  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }

  /// Return the value with at least the specified number of digits
  String padLeft(int width, [String padding = '0']) {
    return toString().padLeft(width, padding);
  }

  /// Check if the value is even
  bool get isEven => this % 2 == 0;

  /// Check if the value is odd
  bool get isOdd => this % 2 != 0;

  /// Convert the value to Roman numerals (1-3999)
  String toRoman() {
    if (this <= 0 || this >= 4000) {
      throw ArgumentError(
        'Roman numerals can only represent values between 1 and 3999',
      );
    }

    final List<String> romanNumerals = [
      'M',
      'CM',
      'D',
      'CD',
      'C',
      'XC',
      'L',
      'XL',
      'X',
      'IX',
      'V',
      'IV',
      'I',
    ];
    final List<int> values = [
      1000,
      900,
      500,
      400,
      100,
      90,
      50,
      40,
      10,
      9,
      5,
      4,
      1,
    ];

    int n = toInt();
    String result = '';

    for (int i = 0; i < romanNumerals.length; i++) {
      while (n >= values[i]) {
        n -= values[i];
        result += romanNumerals[i];
      }
    }

    return result;
  }

  /// Format the number with commas as thousands separators
  String get withCommas {
    final parts = toString().split('.');
    final integerPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return parts.length > 1 ? '$integerPart.${parts[1]}' : integerPart;
  }

  /// Convert the number to its ordinal string representation (1st, 2nd, 3rd, etc.)
  String get toOrdinal {
    final int number = toInt();
    if (number % 100 >= 11 && number % 100 <= 13) {
      return '${number}th';
    }

    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  /// Convert a number to a spelled-out string (only supports 0-999)
  String toWords() {
    final int number = toInt().abs();

    if (number > 999) {
      throw ArgumentError('Number too large: only supports 0-999');
    }

    if (number == 0) {
      return 'zero';
    }

    final List<String> units = [
      '',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen',
    ];

    final List<String> tens = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety',
    ];

    String result = '';

    if (number >= 100) {
      result += '${units[number ~/ 100]} hundred';
      if (number % 100 != 0) {
        result += ' and ';
      }
    }

    if (number % 100 < 20) {
      result += units[number % 100];
    } else {
      result += tens[(number % 100) ~/ 10];
      if (number % 10 != 0) {
        result += '-${units[number % 10]}';
      }
    }

    return result;
  }

  /// Convert radians to degrees
  double get toDegrees => this * (180 / math.pi);

  /// Convert degrees to radians
  double get toRadians => this * (math.pi / 180);

  /// Get the factorial of the number (only works for positive integers <= 20)
  num get factorial {
    if (this < 0 || this != toInt()) {
      throw ArgumentError('Factorial only works for non-negative integers');
    }

    if (this > 20) {
      throw ArgumentError('Factorial too large to compute');
    }

    if (this <= 1) {
      return 1;
    }

    num result = 1;
    for (int i = 2; i <= toInt(); i++) {
      result *= i;
    }

    return result;
  }

  /// Get the number of digits in the integer part
  int get digitCount {
    return toInt().abs().toString().length;
  }

  /// Check if the number is a prime number
  bool get isPrime {
    if (this <= 1 || this != toInt()) {
      return false;
    }

    if (this <= 3) {
      return true;
    }

    if (this % 2 == 0 || this % 3 == 0) {
      return false;
    }

    int i = 5;
    while (i * i <= this) {
      if (this % i == 0 || this % (i + 2) == 0) {
        return false;
      }
      i += 6;
    }

    return true;
  }

  /// Get the number of decimal places
  int get decimalPlaces {
    final String numStr = toString();
    final int dotIndex = numStr.indexOf('.');

    if (dotIndex < 0) {
      return 0;
    }

    return numStr.length - dotIndex - 1;
  }

  /// Convert the number to a byte size string (e.g., 1024 -> "1 KB")
  String toByteSize({int decimals = 2}) {
    const List<String> units = [
      'B',
      'KB',
      'MB',
      'GB',
      'TB',
      'PB',
      'EB',
      'ZB',
      'YB',
    ];

    int i = 0;
    double size = toDouble();

    while (size >= 1024 && i < units.length - 1) {
      size /= 1024;
      i++;
    }

    return '${size.toStringAsFixed(decimals)} ${units[i]}';
  }

  /// Round to the nearest multiple of the given value
  num roundToNearest(num multiple) {
    return (this / multiple).round() * multiple;
  }

  /// Get the signum (-1 for negative, 0 for zero, 1 for positive)
  int get sign {
    if (this > 0) return 1;
    if (this < 0) return -1;
    return 0;
  }
}
