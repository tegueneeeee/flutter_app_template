import 'package:core/src/exception/exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final errorLogger = container.read(errorLoggerProvider);
    final asyncError = _findError(newValue);
    if (asyncError != null) {
      final error = asyncError.error;
      if (error is AppException) {
        // only prints the AppException data
        container
            .read(appExceptionStateNotifierProvider.notifier)
            .notify(error);
        errorLogger.logAppException(error);
      } else {
        // prints everything including the stack trace
        errorLogger.logError(error, asyncError.stackTrace);
      }
    }
  }

  AsyncError<dynamic>? _findError(Object? value) {
    if (value is AsyncError) {
      return value;
    } else {
      return null;
    }
  }
}
