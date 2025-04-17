/// Extension methods for the String class
extension StringExtensions on String {
  /// Capitalize the first letter of the string
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalize the first letter of each word in the string
  String capitalizeEachWord() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Convert the string to snake_case
  String toSnakeCase() {
    if (isEmpty) return this;

    final pattern = RegExp('(?<=[a-z])[A-Z]');

    return replaceAllMapped(
      pattern,
      (match) => '_${match.group(0)}',
    ).toLowerCase();
  }

  /// Convert the string to camelCase
  String toCamelCase() {
    if (isEmpty) return this;

    final words = replaceAll(RegExp(r'[_\-\s]+'), ' ').split(' ');

    if (words.isEmpty) return '';

    final firstWord = words.first.toLowerCase();
    final remainingWords = words
        .skip(1)
        .map((word) => word.capitalize())
        .join('');

    return '$firstWord$remainingWords';
  }

  /// Convert the string to PascalCase
  String toPascalCase() {
    if (isEmpty) return this;

    final camelCase = toCamelCase();
    return camelCase.capitalize();
  }

  /// Convert the string to kebab-case
  String toKebabCase() {
    if (isEmpty) return this;

    return toSnakeCase().replaceAll('_', '-');
  }

  /// Convert the string to title case
  String toTitleCase() {
    if (isEmpty) return this;
    final words = split(' ');
    final articles = ['a', 'an', 'the'];
    final conjunctions = ['and', 'but', 'or', 'nor', 'for', 'yet', 'so'];
    final prepositions = [
      'in',
      'to',
      'for',
      'with',
      'on',
      'at',
      'from',
      'by',
      'about',
      'as',
      'into',
      'like',
      'through',
      'after',
      'over',
      'between',
      'out',
      'against',
      'during',
      'without',
      'before',
      'under',
      'around',
      'among',
    ];

    String result = '';
    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      if (word.isEmpty) {
        result += ' ';
        continue;
      }

      // Always capitalize the first and last word
      if (i == 0 || i == words.length - 1) {
        result += word.capitalize();
      }
      // Don't capitalize articles, conjunctions, and prepositions
      else if (articles.contains(word.toLowerCase()) ||
          conjunctions.contains(word.toLowerCase()) ||
          prepositions.contains(word.toLowerCase())) {
        result += word.toLowerCase();
      } else {
        result += word.capitalize();
      }

      if (i < words.length - 1) {
        result += ' ';
      }
    }

    return result;
  }

  /// Check if the string is a valid email address
  bool get isValidEmail {
    if (isEmpty) return false;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(this);
  }

  /// Check if the string is a valid URL
  bool get isValidUrl {
    if (isEmpty) return false;

    final urlRegex = RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    );

    return urlRegex.hasMatch(this);
  }

  /// Check if the string is a valid phone number
  bool get isValidPhoneNumber {
    if (isEmpty) return false;

    final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');

    return phoneRegex.hasMatch(replaceAll(RegExp(r'[\s\-\(\)]'), ''));
  }

  /// Check if the string is a valid credit card number
  bool get isValidCreditCardNumber {
    if (isEmpty) return false;

    final sanitized = replaceAll(RegExp(r'[^0-9]'), '');

    if (sanitized.length < 13 || sanitized.length > 19) {
      return false;
    }

    // Luhn algorithm
    int sum = 0;
    bool alternate = false;

    for (int i = sanitized.length - 1; i >= 0; i--) {
      int n = int.parse(sanitized[i]);

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

  /// Check if the string is numeric
  bool get isNumeric {
    if (isEmpty) return false;

    return double.tryParse(this) != null;
  }

  /// Check if the string is an integer
  bool get isInteger {
    if (isEmpty) return false;

    return int.tryParse(this) != null;
  }

  /// Check if the string is alphanumeric
  bool get isAlphanumeric {
    if (isEmpty) return false;

    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');

    return alphanumericRegex.hasMatch(this);
  }

  /// Truncate the string to the specified length
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;

    return '${substring(0, maxLength - suffix.length)}$suffix';
  }

  /// Remove all non-alphanumeric characters from the string
  String get alphanumericOnly {
    return replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  /// Remove all non-numeric characters from the string
  String get digitsOnly {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Remove all non-alphabetic characters from the string
  String get alphabeticOnly {
    return replaceAll(RegExp(r'[^a-zA-Z]'), '');
  }

  /// Check if the string is a valid hexadecimal color
  bool get isValidHexColor {
    if (isEmpty) return false;

    final hexColorRegex = RegExp(r'^#?([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$');

    return hexColorRegex.hasMatch(this);
  }

  /// Convert a hexadecimal color to RGBA format
  /// Example: "#FF0000" -> "rgba(255, 0, 0, 1.0)"
  String toRgba({double alpha = 1.0}) {
    if (!isValidHexColor) return this;

    String hex = replaceAll('#', '');

    if (hex.length == 3) {
      hex = hex.split('').map((char) => '$char$char').join('');
    }

    final r = int.parse(hex.substring(0, 2), radix: 16);
    final g = int.parse(hex.substring(2, 4), radix: 16);
    final b = int.parse(hex.substring(4, 6), radix: 16);

    return 'rgba($r, $g, $b, $alpha)';
  }

  /// Check if the string is empty or consists only of whitespace
  bool get isBlank {
    return trim().isEmpty;
  }

  /// Check if the string is not empty and does not consist only of whitespace
  bool get isNotBlank {
    return !isBlank;
  }

  /// Returns the string or null if the string is blank
  String? get nullIfBlank {
    return isBlank ? null : this;
  }

  /// Returns the string or `defaultValue` if the string is blank
  String ifBlank(String defaultValue) {
    return isBlank ? defaultValue : this;
  }

  /// Mask the string with the specified character except for the last N characters
  String maskExceptLast(int n, {String maskChar = '*'}) {
    if (length <= n) return this;

    final visible = substring(length - n);
    final masked = maskChar * (length - n);

    return '$masked$visible';
  }

  /// Mask the string with the specified character except for the first N characters
  String maskExceptFirst(int n, {String maskChar = '*'}) {
    if (length <= n) return this;

    final visible = substring(0, n);
    final masked = maskChar * (length - n);

    return '$visible$masked';
  }

  /// Mask an email address, showing only the first character and the domain
  /// Example: "john.doe@example.com" -> "j***@example.com"
  String maskEmail() {
    if (!contains('@')) return this;

    final parts = split('@');
    if (parts.length != 2) return this;

    final username = parts[0];
    final domain = parts[1];

    if (username.isEmpty) return this;

    final firstChar = username[0];
    final maskedUsername = '$firstChar${'*' * (username.length - 1)}';

    return '$maskedUsername@$domain';
  }

  /// Convert the string to a list of characters
  List<String> toCharList() {
    return split('');
  }

  /// Reverse the string
  String get reversed {
    return split('').reversed.join('');
  }

  /// Get the string with leading and trailing whitespace removed, or null if the string is blank
  String? get trimmedOrNull {
    final trimmed = trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  /// Count the occurrences of a substring in the string
  int countOccurrences(String substring) {
    if (substring.isEmpty) return 0;

    int count = 0;
    int index = 0;

    while (true) {
      index = indexOf(substring, index);
      if (index == -1) break;

      count++;
      index += substring.length;
    }

    return count;
  }

  /// Convert the first character of the string to lowercase
  String get lcFirst {
    if (isEmpty) return this;

    return '${this[0].toLowerCase()}${substring(1)}';
  }

  /// Pluralize the string based on a count
  String pluralize(int count, {String? plural}) {
    if (count == 1) return this;

    if (plural != null) return plural;

    if (endsWith('y') &&
        !endsWith('ay') &&
        !endsWith('ey') &&
        !endsWith('iy') &&
        !endsWith('oy') &&
        !endsWith('uy')) {
      return '${substring(0, length - 1)}ies';
    }

    if (endsWith('s') ||
        endsWith('x') ||
        endsWith('z') ||
        endsWith('ch') ||
        endsWith('sh')) {
      return '${this}es';
    }

    return '${this}s';
  }

  /// Returns true if the string is null or empty
  bool get isNullOrEmpty => isEmpty;

  /// Returns true if the string is not null and not empty
  bool get isNotNullOrEmpty => isNotEmpty;

  /// Returns true if the string is null, empty, or only whitespace
  bool get isNullOrWhiteSpace => trim().isEmpty;

  /// Returns the string, or a default value if the string is null or empty
  String ifEmpty(String defaultValue) {
    return isEmpty ? defaultValue : this;
  }

  /// Returns the string with all whitespace removed
  String get removeWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Returns true if the string is a valid email address
  bool get isEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Returns true if the string is a valid URL
  bool get isUrl {
    return RegExp(r'^(http|https):\/\/[^ "]+$').hasMatch(this);
  }

  /// Returns true if the string contains only digits
  /// Alias for isNumeric, but using regex for strict digit check
  bool get isDigits {
    return RegExp(r'^\d+$').hasMatch(this);
  }

  /// Returns true if the string contains only alpha characters
  bool get isAlpha {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  /// Returns true if the string is a palindrome
  bool get isPalindrome {
    final alphanumeric = replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    return alphanumeric == alphanumeric.split('').reversed.join('');
  }

  /// Splits the string into chunks of the given size
  List<String> chunk(int size) {
    if (size <= 0) {
      throw ArgumentError('Chunk size must be greater than 0');
    }

    final chunks = <String>[];
    for (int i = 0; i < length; i += size) {
      chunks.add(substring(i, (i + size) < length ? i + size : length));
    }

    return chunks;
  }

  /// Pads the string on the left with the given padding to reach the given length
  String padLeftUntil(int length, String padding) {
    if (this.length >= length) return this;
    return padding * ((length - this.length) ~/ padding.length) + this;
  }

  /// Pads the string on the right with the given padding to reach the given length
  String padRightUntil(int length, String padding) {
    if (this.length >= length) return this;
    return this + padding * ((length - this.length) ~/ padding.length);
  }

  /// Returns the string with each character repeated n times
  String repeat(int n) {
    if (n <= 0) return '';
    return split('').map((char) => char * n).join('');
  }

  /// Converts the string to an integer, or returns null if the conversion fails
  int? tryParseInt() {
    return int.tryParse(this);
  }

  /// Converts the string to a double, or returns null if the conversion fails
  double? tryParseDouble() {
    return double.tryParse(this);
  }

  /// Returns the string with the first n characters removed
  String removePrefix(int n) {
    if (n <= 0) return this;
    if (n >= length) return '';
    return substring(n);
  }

  /// Returns the string with the last n characters removed
  String removeSuffix(int n) {
    if (n <= 0) return this;
    if (n >= length) return '';
    return substring(0, length - n);
  }

  /// Returns true if the string contains only whitespace
  bool get isWhitespace {
    return isNotEmpty && trim().isEmpty;
  }

  /// Returns the string with extra whitespace removed
  String get normalizeWhitespace {
    return trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Returns the string with HTML tags removed
  String get stripHtmlTags {
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// Converts the string to a uri encoded string
  String get encodeUri {
    return Uri.encodeFull(this);
  }

  /// Converts the uri encoded string back to a normal string
  String get decodeUri {
    return Uri.decodeFull(this);
  }

  /// Returns a list of words in the string
  List<String> get words {
    return trim().split(RegExp(r'\s+'));
  }

  /// Returns the word count of the string
  int get wordCount {
    return words.length;
  }

  /// Returns a map of character frequencies in the string
  Map<String, int> get charFrequency {
    final Map<String, int> frequency = {};
    for (int i = 0; i < length; i++) {
      final char = this[i];
      frequency[char] = (frequency[char] ?? 0) + 1;
    }
    return frequency;
  }

  /// Returns the most frequent character in the string
  String? get mostFrequentChar {
    if (isEmpty) return null;

    final frequency = charFrequency;
    String? mostFrequent;
    int maxCount = 0;

    frequency.forEach((char, count) {
      if (count > maxCount) {
        maxCount = count;
        mostFrequent = char;
      }
    });

    return mostFrequent;
  }

  /// Splits the string around each match of the given pattern
  /// and returns a list of strings between the matches
  List<String> splitByPattern(Pattern pattern) {
    final matches = pattern.allMatches(this);
    final result = <String>[];

    int lastIndex = 0;
    for (final match in matches) {
      if (match.start > lastIndex) {
        result.add(substring(lastIndex, match.start));
      }
      lastIndex = match.end;
    }

    if (lastIndex < length) {
      result.add(substring(lastIndex));
    }

    return result;
  }
}
