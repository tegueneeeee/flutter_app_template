import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_logger.g.dart';

@Riverpod(keepAlive: true)
ErrorLogger errorLogger(Ref ref) {
  return ErrorLogger();
}

class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace) {
    logger.severe('$error, $stackTrace');
  }

  void logAppException(AppException exception) {
    logger.severe('$exception');
  }
}
