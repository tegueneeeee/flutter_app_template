import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

/// Core logging system
class CoreLogger {
  CoreLogger._();

  /// Global logger instance
  static final SimpleLogger _logger =
      SimpleLogger()
        ..setLevel(
          kReleaseMode ? Level.WARNING : Level.FINEST,
          includeCallerInfo: !kReleaseMode,
        )
        ..formatter = (info) {
          final level = info.level.name.padRight(8);
          return '${info.time} | $level | ${info.callerFrame ?? ''} ${info.message}';
        };

  /// Logs a verbose message
  static void verbose(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.finest(message);
    _logToConsole('VERBOSE', message, error, stackTrace);
  }

  /// Logs a debug message
  static void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.fine(message);
    _logToConsole('DEBUG', message, error, stackTrace);
  }

  /// Logs an info message
  static void info(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.info(message);
    _logToConsole('INFO', message, error, stackTrace);
  }

  /// Logs a warning message
  static void warning(
    dynamic message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _logger.warning(message);
    _logToConsole('WARNING', message, error, stackTrace);
  }

  /// Logs an error message
  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.severe(message);
    _logToConsole('ERROR', message, error, stackTrace);
  }

  /// Log to both SimpleLogger and dart:developer for better visibility
  static void _logToConsole(
    String level,
    dynamic message,
    dynamic error,
    StackTrace? stackTrace,
  ) {
    if (!kDebugMode) return;

    final fullMessage = '$message${error != null ? '\nError: $error' : ''}';

    developer.log(
      fullMessage,
      name: 'CORE',
      level: _getLogLevel(level),
      error: error,
      stackTrace: stackTrace,
    );
  }

  static int _getLogLevel(String level) {
    switch (level) {
      case 'VERBOSE':
        return 0;
      case 'DEBUG':
        return 500;
      case 'INFO':
        return 800;
      case 'WARNING':
        return 900;
      case 'ERROR':
        return 1000;
      default:
        return 800;
    }
  }
}

/// Global access to core logger
const logger = CoreLogger;
