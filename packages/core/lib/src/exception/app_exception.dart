import 'package:flutter/foundation.dart';

sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;
}

class UnSupportedPlatformException extends AppException {
  UnSupportedPlatformException()
    : super('Unsupported platform: $defaultTargetPlatform');
}

class UnknownException extends AppException {
  const UnknownException() : super('Unknown error occurred');
}
