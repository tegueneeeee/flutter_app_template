/// Extension methods for validating different data types
extension ValidationExtensions on String {
  /// Email validation regex pattern
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  /// Phone number validation regex pattern (simple version)
  static final RegExp _phoneRegExp = RegExp(r'^\+?[0-9]{8,15}$');

  /// URL validation regex pattern
  static final RegExp _urlRegExp = RegExp(
    r'^(http|https)://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$',
  );

  /// Password strength regex pattern (min 8 chars, at least 1 letter and 1 number)
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  /// Credit card number validation regex pattern
  static final RegExp _creditCardRegExp = RegExp(
    r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$',
  );

  /// Validate if the string is a valid email address
  bool get isValidEmail {
    if (isEmpty) return false;
    return _emailRegExp.hasMatch(this);
  }

  /// Validate if the string is a valid phone number
  bool get isValidPhoneNumber {
    if (isEmpty) return false;
    // Remove any non-digit characters for validation
    final digitsOnly = replaceAll(RegExp(r'\D'), '');
    return _phoneRegExp.hasMatch(digitsOnly);
  }

  /// Validate if the string is a valid URL
  bool get isValidUrl {
    if (isEmpty) return false;
    return _urlRegExp.hasMatch(this);
  }

  /// Validate if the string meets password requirements
  bool get isValidPassword {
    if (isEmpty) return false;
    return _passwordRegExp.hasMatch(this);
  }

  /// Validate if the string is a valid credit card number
  bool get isValidCreditCardNumber {
    if (isEmpty) return false;
    // Remove any non-digit characters for validation
    final digitsOnly = replaceAll(RegExp(r'\D'), '');
    if (!_creditCardRegExp.hasMatch(digitsOnly)) return false;

    // Luhn algorithm check
    return _validateLuhnAlgorithm(digitsOnly);
  }

  /// Validate using the Luhn algorithm (for credit card numbers)
  bool _validateLuhnAlgorithm(String digits) {
    int sum = 0;
    bool alternate = false;

    for (int i = digits.length - 1; i >= 0; i--) {
      int n = int.parse(digits[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  /// Validate if the string is an integer
  bool get isInteger {
    if (isEmpty) return false;
    return int.tryParse(this) != null;
  }

  /// Validate if the string is a double
  bool get isDouble {
    if (isEmpty) return false;
    return double.tryParse(this) != null;
  }

  /// Validate if the string is a valid date in the format yyyy-MM-dd
  bool get isValidDate {
    if (isEmpty) return false;

    final RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegExp.hasMatch(this)) return false;

    final parts = split('-');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);

    if (month < 1 || month > 12) return false;

    final daysInMonth = [
      31,
      _isLeapYear(year) ? 29 : 28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
    ];
    return day >= 1 && day <= daysInMonth[month - 1];
  }

  /// Validate if a string is a valid UUID
  bool get isValidUuid {
    if (isEmpty) return false;

    final RegExp uuidRegExp = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      caseSensitive: false,
    );

    return uuidRegExp.hasMatch(this);
  }

  /// Validate if a password has at least one uppercase letter
  bool get hasUppercase => contains(RegExp(r'[A-Z]'));

  /// Validate if a password has at least one lowercase letter
  bool get hasLowercase => contains(RegExp(r'[a-z]'));

  /// Validate if a password has at least one digit
  bool get hasDigit => contains(RegExp(r'[0-9]'));

  /// Validate if a password has at least one special character
  bool get hasSpecialCharacter => contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  /// Get the strength of a password on a scale of 0-5
  int get passwordStrength {
    if (isEmpty) return 0;

    int strength = 0;
    if (length >= 8) strength++;
    if (hasUppercase) strength++;
    if (hasLowercase) strength++;
    if (hasDigit) strength++;
    if (hasSpecialCharacter) strength++;

    return strength;
  }
}

/// Extension for integer validation
extension IntValidationExtensions on int {
  /// Check if a year is a leap year
  bool get isLeapYear =>
      (this % 4 == 0 && this % 100 != 0) || (this % 400 == 0);
}

/// Private helper function for checking leap years
bool _isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}
