import 'package:features_webview/src/domain/entities/web_url.dart';
import 'package:features_webview/src/domain/use_cases/load_web_url_use_case.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/dependencies.dart';
import 'package:webview_flutter/webview_flutter.dart' as webview_flutter;

part 'webview_state.g.dart';

/// Provider for the webview state
@riverpod
class WebviewState extends _$WebviewState {
  @override
  AsyncValue<WebUrl?> build() {
    return const AsyncValue.data(null);
  }

  /// Load a URL
  Future<void> loadUrl(String url) async {
    state = const AsyncValue.loading();

    final result = await AsyncValue.guard(() async {
      final useCase = ref.read(loadWebUrlUseCaseProvider);
      return useCase(url);
    });

    state = result;
  }

  /// Reset the state
  void reset() {
    state = const AsyncValue.data(null);
  }
}

/// Provider for the webview controller
@riverpod
class WebViewController extends _$WebViewController {
  @override
  webview_flutter.WebViewController build() {
    return webview_flutter.WebViewController();
  }

  /// Initialize the controller with the given URL
  void initialize(WebUrl url) {
    state
      ..setJavaScriptMode(webview_flutter.JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        webview_flutter.NavigationDelegate(
          onProgress: (progress) {
            ref.read(progressRateProvider.notifier).state = progress / 100;
          },
          onPageStarted: (_) {
            ref.read(isLoadingProvider.notifier).state = true;
            ref.read(hasErrorProvider.notifier).state = false;
          },
          onPageFinished: (_) {
            ref.read(isLoadingProvider.notifier).state = false;
          },
          onWebResourceError: (error) {
            debugPrint(error.toString());
            ref.read(isLoadingProvider.notifier).state = false;
            ref.read(hasErrorProvider.notifier).state = true;
          },
          onNavigationRequest: (request) {
            // Could add URL filtering here
            return webview_flutter.NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(url.uri);
  }

  /// Reload the current page
  Future<void> reload() async {
    await state.reload();
  }

  /// Check if we can go back
  Future<bool> canGoBack() async {
    return state.canGoBack();
  }

  /// Navigate back
  Future<void> goBack() async {
    await state.goBack();
  }
}

/// Provider for the loading state
@riverpod
class IsLoading extends _$IsLoading {
  @override
  bool build() => false;
}

/// Provider for the error state
@riverpod
class HasError extends _$HasError {
  @override
  bool build() => false;
}

/// Provider for the progress rate
@riverpod
class ProgressRate extends _$ProgressRate {
  @override
  double build() => 0;
}

/// Provider for the can pop state
@riverpod
class CanPop extends _$CanPop {
  @override
  bool build() => false;
}
