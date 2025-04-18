import 'package:features_webview/src/domain/entities/web_url.dart';
import 'package:features_webview/src/domain/repositories/webview_repository.dart';
import 'package:features_webview/src/domain/use_cases/load_web_url_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webview_repository_impl.g.dart';

/// Provider for [WebviewRepository]
@riverpod
WebviewRepository webviewRepositoryImpl(WebviewRepositoryImplRef ref) {
  return WebviewRepositoryImpl();
}

/// Implementation of [WebviewRepository]
class WebviewRepositoryImpl implements WebviewRepository {
  /// Construct a WebviewRepository
  WebviewRepositoryImpl({List<String>? allowedDomains})
    : _allowedDomains = allowedDomains ?? _defaultAllowedDomains;

  final List<String> _allowedDomains;

  // Default list of allowed domains
  static const List<String> _defaultAllowedDomains = [
    'flutter.dev',
    'pub.dev',
    'github.com',
    'dart.dev',
    'google.com',
    'example.com',
  ];

  @override
  WebUrl validateUrl(String url) {
    try {
      return WebUrl(url);
    } on ArgumentError catch (e) {
      throw ArgumentError('Invalid URL: $url - ${e.message}');
    }
  }

  @override
  Future<bool> isUrlAllowed(WebUrl url) async {
    // If allowed domains list is empty, all domains are allowed
    if (_allowedDomains.isEmpty) {
      return true;
    }

    // Check if the domain is in the allowed list
    final host = url.host;
    return _allowedDomains.any(
      (domain) => host == domain || host.endsWith('.$domain'),
    );
  }

  @override
  Future<void> recordUrlVisit(WebUrl url) async {
    // In a real implementation, this would record the visit in analytics
    // or browser history. For this sample, we'll just print to the console.
    print('URL visited: ${url.value}');
  }
}
