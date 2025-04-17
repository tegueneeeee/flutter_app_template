import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Log levels for different types of messages
enum LogLevel {
  /// Verbose level for detailed debugging information
  verbose,

  /// Debug level for development debugging
  debug,

  /// Info level for general information
  info,

  /// Warning level for potential issues
  warning,

  /// Error level for actual errors
  error,

  /// Critical level for fatal errors
  critical,
}

/// A service for logging messages throughout the application
/// This service is platform-agnostic and can be used in place of
/// print statements or directly importing logging packages
class LogService {
  LogService._();

  /// The minimum log level to display
  /// Set to [LogLevel.verbose] in debug mode and [LogLevel.warning] in release mode
  static LogLevel logLevel = kDebugMode ? LogLevel.verbose : LogLevel.warning;

  /// Log a message at the verbose level
  static void v(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.verbose,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at the debug level
  static void d(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.debug,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at the info level
  static void i(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.info,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at the warning level
  static void w(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.warning,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at the error level
  static void e(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.error,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at the critical level
  static void wtf(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.critical,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Internal method to log messages at specific levels
  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (level.index < logLevel.index) return;

    final timestamp = DateTime.now().toIso8601String();
    final prefix =
        '[$timestamp][${level.name.toUpperCase()}]${tag != null ? '[$tag]' : ''}';
    final fullMessage = '$prefix $message';

    if (error != null) {
      developer.log(
        fullMessage,
        time: DateTime.now(),
        name: tag ?? 'APP',
        error: error,
        stackTrace: stackTrace,
      );
    } else {
      developer.log(fullMessage, time: DateTime.now(), name: tag ?? 'APP');
    }

    // Only print to console in debug mode
    if (kDebugMode) {
      // Use different colors based on log level for better readability in console
      switch (level) {
        case LogLevel.verbose:
          print('\x1B[37m$fullMessage\x1B[0m'); // White
          break;
        case LogLevel.debug:
          print('\x1B[36m$fullMessage\x1B[0m'); // Cyan
          break;
        case LogLevel.info:
          print('\x1B[32m$fullMessage\x1B[0m'); // Green
          break;
        case LogLevel.warning:
          print('\x1B[33m$fullMessage\x1B[0m'); // Yellow
          break;
        case LogLevel.error:
          print('\x1B[31m$fullMessage\x1B[0m'); // Red
          break;
        case LogLevel.critical:
          print('\x1B[35m$fullMessage\x1B[0m'); // Magenta
          break;
      }

      if (error != null) {
        print('\x1B[31mError: $error\x1B[0m');
        if (stackTrace != null) {
          print('\x1B[31mStack trace: $stackTrace\x1B[0m');
        }
      }
    }
  }
}
