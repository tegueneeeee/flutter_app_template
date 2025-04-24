import 'package:flutter/foundation.dart';

/// Exception for when version information cannot be retrieved
class VersionInfoUnavailableException extends AppException {
  /// Constructor
  const VersionInfoUnavailableException({this.cause})
    : super('Could not retrieve version information: $cause');

  /// The underlying cause of the exception
  final Object? cause;
}

/// Exception for when app store cannot be opened
class AppStoreUnavailableException extends RemoteConfigException {
  /// Constructor
  const AppStoreUnavailableException({this.cause})
    : super('Could not open app store: $cause');

  /// The underlying cause of the exception
  final Object? cause;
}

/// Exception for when the platform is not supported
class UnSupportedPlatformException extends RemoteConfigException {
  /// Constructor
  UnSupportedPlatformException()
    : super('Unsupported platform: $defaultTargetPlatform');
}
