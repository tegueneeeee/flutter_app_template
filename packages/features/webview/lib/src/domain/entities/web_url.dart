import 'package:shared_dependencies/dependencies.dart';

/// Represents a validated web URL
class WebUrl extends Equatable {
  /// Creates a [WebUrl] with the given URL string
  ///
  /// Will throw [ArgumentError] if the URL is invalid
  factory WebUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      throw ArgumentError('Invalid URL: $url');
    }
    return WebUrl._(uri);
  }

  /// Creates a [WebUrl] from a [Uri] object
  const WebUrl._(this.uri);

  /// The actual Uri object
  final Uri uri;

  /// Returns the URL as a string
  String get value => uri.toString();

  /// Returns true if the URL is HTTPS
  bool get isSecure => uri.scheme == 'https';

  /// Returns the host of the URL
  String get host => uri.host;

  /// Returns the path of the URL
  String get path => uri.path;

  @override
  List<Object?> get props => [uri];
}
