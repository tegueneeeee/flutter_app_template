/// Extension methods for int class
extension IntExtensions on int {
  /// Convert integer to binary string representation
  String get toBinary => toRadixString(2);

  /// Convert integer to octal string representation
  String get toOctal => toRadixString(8);

  /// Convert integer to hexadecimal string representation
  String get toHex => toRadixString(16);

  /// Convert integer to hexadecimal string with 0x prefix
  String get toHexWithPrefix => '0x${toRadixString(16)}';

  /// Get list of digits in the integer
  List<int> get digits => toString().split('').map(int.parse).toList();

  /// Check if the integer is a power of two
  bool get isPowerOfTwo => this > 0 && (this & (this - 1)) == 0;

  /// Get the number of bits set to 1 in the binary representation
  int get bitCount {
    int count = 0;
    int n = this;
    while (n != 0) {
      count += n & 1;
      n >>= 1;
    }
    return count;
  }

  /// Add a trailing zero to the integer (multiply by 10)
  int get appendZero => this * 10;

  /// Remove the last digit from the integer (integer division by 10)
  int get removeLastDigit => this ~/ 10;

  /// Get the last digit of the integer
  int get lastDigit => this % 10;

  /// Check if the integer's binary representation has the bit at the given position set
  bool hasBitSet(int position) {
    if (position < 0) {
      throw ArgumentError('Position must be non-negative');
    }
    return (this & (1 << position)) != 0;
  }

  /// Reverse the order of digits in the integer
  int get reversed {
    int result = 0;
    int n = this.abs();

    while (n > 0) {
      result = result * 10 + n % 10;
      n ~/= 10;
    }

    return this < 0 ? -result : result;
  }

  /// Check if the integer is a palindrome (reads the same backward as forward)
  bool get isPalindrome => this == reversed;

  /// Check if the integer has repeating digits
  bool get hasRepeatingDigits {
    final digits = toString().split('');
    return digits.toSet().length < digits.length;
  }

  /// Check if the integer has only unique digits
  bool get hasUniqueDigits {
    final digits = toString().split('');
    return digits.toSet().length == digits.length;
  }

  /// Get a list of all divisors of the integer
  List<int> get divisors {
    if (this == 0) return [];
    if (this < 0) return (-this).divisors;

    final List<int> result = [];
    for (int i = 1; i * i <= this; i++) {
      if (this % i == 0) {
        result.add(i);
        if (i != this ~/ i) {
          result.add(this ~/ i);
        }
      }
    }

    result.sort();
    return result;
  }

  /// Get the sum of all divisors of the integer
  int get divisorsSum {
    return divisors.fold(0, (a, b) => a + b);
  }

  /// Check if the integer is a perfect number
  /// (equal to the sum of its proper divisors)
  bool get isPerfect {
    if (this <= 1) return false;
    return divisorsSum - this == this;
  }

  /// Check if the integer is a deficient number
  /// (sum of proper divisors < number)
  bool get isDeficient {
    if (this <= 1) return false;
    return divisorsSum - this < this;
  }

  /// Check if the integer is an abundant number
  /// (sum of proper divisors > number)
  bool get isAbundant {
    if (this <= 1) return false;
    return divisorsSum - this > this;
  }

  /// Format the integer with padding zeros
  String padZeros(int width) {
    return toString().padLeft(width, '0');
  }

  /// Format a timestamp (in milliseconds since epoch) to a readable time string
  String toTimeString() {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    return '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}:'
        '${dateTime.second.toString().padLeft(2, '0')}';
  }

  /// Format a timestamp (in milliseconds since epoch) to a readable date string
  String toDateString() {
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    return '${dateTime.year}-'
        '${dateTime.month.toString().padLeft(2, '0')}-'
        '${dateTime.day.toString().padLeft(2, '0')}';
  }

  /// Convert integer (milliseconds) to DateTime object
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }

  /// Get a range from 0 to n-1
  Iterable<int> range() {
    if (this < 0) {
      throw ArgumentError('Cannot create range with negative number');
    }
    return Iterable<int>.generate(this);
  }

  /// Get a range from start to start+n-1
  Iterable<int> rangeFrom(int start) {
    if (this < 0) {
      throw ArgumentError('Cannot create range with negative length');
    }
    return Iterable<int>.generate(this, (i) => start + i);
  }

  /// Repeat a function n times
  void times(void Function(int index) action) {
    if (this <= 0) return;
    for (int i = 0; i < this; i++) {
      action(i);
    }
  }

  /// Check if the integer is in a given range (inclusive)
  bool isInRange(int min, int max) {
    return this >= min && this <= max;
  }

  /// Create a List with the specified length and filled with the result of calling
  /// the builder function on each index
  List<T> generate<T>(T Function(int index) builder) {
    if (this < 0) {
      throw ArgumentError('Cannot generate list with negative length');
    }

    return List<T>.generate(this, builder);
  }

  /// Create a fixed-size list filled with the given value
  List<T> filled<T>(T value) {
    if (this < 0) {
      throw ArgumentError('Cannot create list with negative length');
    }

    return List<T>.filled(this, value);
  }

  /// Get the greatest common divisor with another integer
  int gcd(int other) {
    int a = this.abs();
    int b = other.abs();

    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }

    return a;
  }

  /// Get the least common multiple with another integer
  int lcm(int other) {
    if (this == 0 || other == 0) return 0;
    return (this * other).abs() ~/ gcd(other);
  }
}
