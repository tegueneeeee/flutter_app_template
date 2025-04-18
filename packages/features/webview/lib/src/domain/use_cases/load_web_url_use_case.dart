import 'package:core/core.dart';
import 'package:features_webview/src/domain/entities/web_url.dart';
import 'package:features_webview/src/domain/repositories/webview_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'load_web_url_use_case.g.dart';

/// Provider for the [LoadWebUrlUseCase]
@riverpod
LoadWebUrlUseCase loadWebUrlUseCase(LoadWebUrlUseCaseRef ref) {
  return LoadWebUrlUseCase(repository: ref.watch(webviewRepositoryProvider));
}

/// Provider for the [WebviewRepository]
@riverpod
WebviewRepository webviewRepository(WebviewRepositoryRef ref) {
  // This should be overridden by the actual implementation
  throw UnimplementedError(
    'webviewRepositoryProvider was not overridden. '
    'Make sure to override this provider in your app.',
  );
}

/// Use case to load and validate a web URL
class LoadWebUrlUseCase implements UseCase<WebUrl, String, WebviewRepository> {
  /// Constructor
  const LoadWebUrlUseCase({required this.repository});

  /// The webview repository
  @override
  final WebviewRepository repository;

  @override
  Future<WebUrl> call(String params) async {
    try {
      // Validate the URL
      final webUrl = repository.validateUrl(params);

      // Check if URL is allowed
      final isAllowed = await repository.isUrlAllowed(webUrl);
      if (!isAllowed) {
        throw const WebViewException('This URL is not allowed');
      }

      // Record the URL visit
      await repository.recordUrlVisit(webUrl);

      return webUrl;
    } on ArgumentError catch (e) {
      throw WebViewException('Invalid URL: ${e.message}');
    } catch (e) {
      if (e is WebViewException) rethrow;
      throw WebViewException('Error loading URL: $e');
    }
  }
}

/// Exception thrown when there's an error with webview operations
class WebViewException implements Exception {
  /// Constructor
  const WebViewException(this.message);

  /// Error message
  final String message;

  @override
  String toString() => 'WebViewException: $message';
}
