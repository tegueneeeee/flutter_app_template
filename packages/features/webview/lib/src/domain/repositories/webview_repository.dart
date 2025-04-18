import 'package:features_webview/src/domain/entities/web_url.dart';

/// Repository for webview operations
abstract interface class WebviewRepository {
  /// Validates a URL string and returns a [WebUrl] entity
  ///
  /// Throws [ArgumentError] if the URL is invalid
  WebUrl validateUrl(String url);

  /// Checks if the URL is in the whitelist
  ///
  /// Returns true if the URL is allowed
  Future<bool> isUrlAllowed(WebUrl url);

  /// Records a URL visit for analytics or history tracking
  Future<void> recordUrlVisit(WebUrl url);
}
