/// Base exception for force update feature
sealed class ForceUpdateException implements Exception {
  /// Constructor
  const ForceUpdateException(this.message);

  /// Error message
  final String message;
}

/// Exception for when version information cannot be retrieved
class VersionInfoUnavailableException extends ForceUpdateException {
  /// Constructor
  const VersionInfoUnavailableException({this.cause})
    : super('Could not retrieve version information: $cause');

  /// The underlying cause of the exception
  final Object? cause;
}

/// Exception for when app store cannot be opened
class AppStoreUnavailableException extends ForceUpdateException {
  /// Constructor
  const AppStoreUnavailableException({this.cause})
    : super('Could not open app store: $cause');

  /// The underlying cause of the exception
  final Object? cause;
}
