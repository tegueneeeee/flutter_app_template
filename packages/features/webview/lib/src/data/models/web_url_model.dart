import 'package:features_webview/src/domain/entities/web_url.dart';

/// Data model for a web URL
class WebUrlModel {
  /// Creates a [WebUrlModel] with the given URL string
  const WebUrlModel({required this.url});

  /// Creates a [WebUrlModel] from a [WebUrl] entity
  factory WebUrlModel.fromDomain(WebUrl domain) {
    return WebUrlModel(url: domain.value);
  }

  /// The URL string
  final String url;

  /// Maps this model to a domain entity [WebUrl]
  WebUrl toDomain() => WebUrl(url);
}
