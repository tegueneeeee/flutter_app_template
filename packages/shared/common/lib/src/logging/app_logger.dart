import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

/// App-wide logging utility
class AppLogger {
  /// Private constructor to prevent instantiation
  AppLogger._();

  /// Global logger instance
  static final SimpleLogger _logger =
      SimpleLogger()
        ..setLevel(
          kDebugMode ? Level.ALL : Level.WARNING,
          includeCallerInfo: kDebugMode,
        )
        ..formatter = (info) {
          final level = info.level.name.padRight(8);
          return '${info.time} | $level | ${info.callerFrame ?? ''} ${info.message}';
        };

  /// Custom logger for development logs (includes file name, line number)
  static SimpleLogger getLogger(String className) {
    return SimpleLogger()
      ..setLevel(
        kDebugMode ? Level.ALL : Level.WARNING,
        includeCallerInfo: kDebugMode,
      )
      ..formatter = (info) {
        final level = info.level.name.padRight(8);
        return '${info.time} | $level | $className | ${info.callerFrame ?? ''} ${info.message}';
      };
  }

  /// Logs a verbose message
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.finest(message);
    if (error != null) {
      _logger.finest('Error: $error');
      if (stackTrace != null) {
        _logger.finest('Stack trace: $stackTrace');
      }
    }
  }

  /// Logs a debug message
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.fine(message);
    if (error != null) {
      _logger.fine('Error: $error');
      if (stackTrace != null) {
        _logger.fine('Stack trace: $stackTrace');
      }
    }
  }

  /// Logs an info message
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.info(message);
    if (error != null) {
      _logger.info('Error: $error');
      if (stackTrace != null) {
        _logger.info('Stack trace: $stackTrace');
      }
    }
  }

  /// Logs a warning message
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.warning(message);
    if (error != null) {
      _logger.warning('Error: $error');
      if (stackTrace != null) {
        _logger.warning('Stack trace: $stackTrace');
      }
    }
  }

  /// Logs an error message
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.severe(message);
    if (error != null) {
      _logger.severe('Error: $error');
      if (stackTrace != null) {
        _logger.severe('Stack trace: $stackTrace');
      }
    }
  }

  /// Logs a critical error message
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.shout(message);
    if (error != null) {
      _logger.shout('Error: $error');
      if (stackTrace != null) {
        _logger.shout('Stack trace: $stackTrace');
      }
    }
  }
}

/// Extension for more concise logger creation
extension LoggerExtension on Object {
  /// Get a logger instance with the class name
  SimpleLogger get logger => AppLogger.getLogger(runtimeType.toString());
}
