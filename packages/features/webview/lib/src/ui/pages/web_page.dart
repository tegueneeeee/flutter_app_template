import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends HookWidget {
  const WebPage({required this.initialUri, required this.pop, super.key});

  final Uri initialUri;
  final VoidCallback pop;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);
    final canPop = useState<bool>(false);
    final hasError = useState<bool>(false);
    final progressRate = useState<double>(0);

    final webViewController = useMemoized<WebViewController>(() {
      final controller =
          WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (progress) async {
                  progressRate.value = progress / 100;
                },
                onPageStarted: (url) {
                  isLoading.value = true;
                  hasError.value = false;
                },
                onPageFinished: (url) {
                  isLoading.value = false;
                },
                onWebResourceError: (error) {
                  isLoading.value = false;
                  hasError.value = true;
                },
              ),
            )
            ..loadRequest(initialUri);
      return controller;
    }, [],);
    return PopScope(
      canPop: canPop.value,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        final controller = webViewController;
        if (await controller.canGoBack()) {
          await controller.goBack();
        } else {
          pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Webview')),
        body: Stack(
          children: [
            WebViewWidget(controller: webViewController),
            if (1 > progressRate.value)
              LinearProgressIndicator(
                value: progressRate.value,
                backgroundColor: Colors.lightBlue,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                minHeight: 2,
              ),
            if (hasError.value)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('An error occurred while loading'),
                    TextButton(
                      onPressed: () async {
                        hasError.value = false;
                        await webViewController.reload();
                      },
                      child: const Text('Reload'),
                    ),
                  ],
                ),
              ),
            if (isLoading.value)
              const Center(child: CircularProgressIndicator.adaptive()),
          ],
        ),
      ),
    );
  }
}
