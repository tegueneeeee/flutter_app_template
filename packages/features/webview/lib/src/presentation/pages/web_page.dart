import 'package:features_webview/src/presentation/states/webview_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/dependencies.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A page that displays a web view with loading and error indicators
class WebPage extends ConsumerWidget {
  /// Creates a new [WebPage] with the given URL and pop callback
  const WebPage({
    required this.initialUrl,
    required this.onPop,
    this.title = 'Webview',
    super.key,
  });

  /// The URL to load initially
  final String initialUrl;

  /// Callback when the user wants to go back but can't
  final VoidCallback onPop;

  /// The title to display in the app bar
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // State providers
    final isLoading = ref.watch(isLoadingProvider);
    final hasError = ref.watch(hasErrorProvider);
    final progressRate = ref.watch(progressRateProvider);
    final canPop = ref.watch(canPopProvider);

    // URL state
    final urlState = ref.watch(webviewStateProvider);

    // Web controller
    final controller = ref.watch(webViewControllerProvider);

    // Load URL if not already loaded
    ref.listen(webviewStateProvider, (previous, next) {
      if (next is AsyncData && next.value != null) {
        ref.read(webViewControllerProvider.notifier).initialize(next.value!);
      }
    });

    // Load initial URL on first build
    useEffect(() {
      if (urlState.value == null) {
        ref.read(webviewStateProvider.notifier).loadUrl(initialUrl);
      }
      return null;
    }, []);

    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }

        final controllerNotifier = ref.read(webViewControllerProvider.notifier);
        if (await controllerNotifier.canGoBack()) {
          await controllerNotifier.goBack();
        } else {
          onPop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed:
                  () => ref.read(webViewControllerProvider.notifier).reload(),
            ),
          ],
        ),
        body: urlState.when(
          loading:
              () => const Center(child: CircularProgressIndicator.adaptive()),
          error:
              (error, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading page: $error',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed:
                          () => ref
                              .read(webviewStateProvider.notifier)
                              .loadUrl(initialUrl),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
          data: (url) {
            if (url == null) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            return Stack(
              children: [
                WebViewWidget(controller: controller),
                if (progressRate > 0 && progressRate < 1)
                  LinearProgressIndicator(
                    value: progressRate,
                    backgroundColor: Colors.lightBlue.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.blue,
                    ),
                    minHeight: 3,
                  ),
                if (hasError)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'An error occurred while loading the page',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            ref.read(hasErrorProvider.notifier).state = false;
                            await ref
                                .read(webViewControllerProvider.notifier)
                                .reload();
                          },
                          child: const Text('Reload'),
                        ),
                      ],
                    ),
                  ),
                if (isLoading)
                  ColoredBox(
                    color: Colors.white.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
