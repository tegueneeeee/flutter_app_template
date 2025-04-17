import 'package:intl/intl.dart';

/// Extension methods for DateTime class
extension DateTimeExtensions on DateTime {
  /// Format the date using the given format
  String format(String pattern) {
    return DateFormat(pattern).format(this);
  }

  /// Format the date as 'yyyy-MM-dd'
  String get toDateString {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Format the date as 'HH:mm:ss'
  String get toTimeString {
    return DateFormat('HH:mm:ss').format(this);
  }

  /// Format the date as 'yyyy-MM-dd HH:mm:ss'
  String get toDateTimeString {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  }

  /// Format the date in ISO 8601 format
  String get toIsoString {
    return toUtc().toIso8601String();
  }

  /// Get the start of the day (00:00:00.000)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Get the end of the day (23:59:59.999)
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  /// Get the start of the week (Sunday)
  DateTime get startOfWeek {
    final daysToSubtract = weekday % 7;
    return startOfDay.subtract(Duration(days: daysToSubtract));
  }

  /// Get the end of the week (Saturday)
  DateTime get endOfWeek {
    final daysToAdd = 6 - (weekday % 7);
    return endOfDay.add(Duration(days: daysToAdd));
  }

  /// Get the start of the month
  DateTime get startOfMonth {
    return DateTime(year, month, 1);
  }

  /// Get the end of the month
  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0, 23, 59, 59, 999);
  }

  /// Get the start of the year
  DateTime get startOfYear {
    return DateTime(year, 1, 1);
  }

  /// Get the end of the year
  DateTime get endOfYear {
    return DateTime(year, 12, 31, 23, 59, 59, 999);
  }

  /// Check if the date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if the date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Check if the date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if the date is in the future
  bool get isFuture {
    return isAfter(DateTime.now());
  }

  /// Check if the date is in the past
  bool get isPast {
    return isBefore(DateTime.now());
  }

  /// Check if the date is in the same day as another date
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Check if the date is in the same month as another date
  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  /// Check if the date is in the same year as another date
  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  /// Check if the date is on a weekend (Saturday or Sunday)
  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  /// Check if the date is on a weekday (Monday to Friday)
  bool get isWeekday {
    return !isWeekend;
  }

  /// Add days to the date
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// Subtract days from the date
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  /// Add weeks to the date
  DateTime addWeeks(int weeks) {
    return add(Duration(days: weeks * 7));
  }

  /// Subtract weeks from the date
  DateTime subtractWeeks(int weeks) {
    return subtract(Duration(days: weeks * 7));
  }

  /// Add months to the date
  DateTime addMonths(int months) {
    var year = this.year;
    var month = this.month + months;

    while (month > 12) {
      month -= 12;
      year++;
    }

    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Subtract months from the date
  DateTime subtractMonths(int months) {
    var year = this.year;
    var month = this.month - months;

    while (month <= 0) {
      month += 12;
      year--;
    }

    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Add years to the date
  DateTime addYears(int years) {
    return DateTime(
      year + years,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Subtract years from the date
  DateTime subtractYears(int years) {
    return DateTime(
      year - years,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Get the difference in days between this date and another date
  int daysDifference(DateTime other) {
    final diff = difference(other);
    return diff.inDays;
  }

  /// Get the difference in months between this date and another date
  int monthsDifference(DateTime other) {
    return (year - other.year) * 12 + month - other.month;
  }

  /// Get the difference in years between this date and another date
  int yearsDifference(DateTime other) {
    var years = year - other.year;
    if (month < other.month || (month == other.month && day < other.day)) {
      years--;
    }
    return years;
  }

  /// Get the age in years from this date
  int get age {
    return yearsDifference(DateTime.now());
  }

  /// Get the date's quarter (1-4)
  int get quarter {
    return ((month - 1) / 3).floor() + 1;
  }

  /// Get a human-readable relative time string
  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inDays > 365) {
      final years = (diff.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }

    if (diff.inDays > 30) {
      final months = (diff.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    }

    if (diff.inDays > 7) {
      final weeks = (diff.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    }

    if (diff.inDays > 0) {
      return '${diff.inDays} ${diff.inDays == 1 ? 'day' : 'days'} ago';
    }

    if (diff.inHours > 0) {
      return '${diff.inHours} ${diff.inHours == 1 ? 'hour' : 'hours'} ago';
    }

    if (diff.inMinutes > 0) {
      return '${diff.inMinutes} ${diff.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    }

    return 'just now';
  }

  /// Get a human-readable date string
  String get toHumanReadableDate {
    if (isToday) {
      return 'Today';
    }

    if (isYesterday) {
      return 'Yesterday';
    }

    if (isTomorrow) {
      return 'Tomorrow';
    }

    // If within the last 7 days, show the day name
    final now = DateTime.now();
    final difference = now.difference(this).inDays;

    if (difference > 0 && difference < 7) {
      return DateFormat('EEEE').format(this); // Day name
    }

    // This year
    if (year == now.year) {
      return DateFormat('MMM d').format(this); // Jan 1
    }

    // Different year
    return DateFormat('MMM d, yyyy').format(this); // Jan 1, 2022
  }

  /// Check if the date is a leap year
  bool get isLeapYear {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  /// Get the number of days in the month
  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  /// Get the date in a copy with the time set to noon
  DateTime get noon {
    return DateTime(year, month, day, 12);
  }

  /// Copy the date with modified fields
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
