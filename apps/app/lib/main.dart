import 'package:flutter/material.dart';
import 'package:flutter_app/app_initializer.dart';
import 'package:flutter_app/core/provider/app_exception_notifier_provider.dart';
import 'package:flutter_app/core/util/snack_bar_manager.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final (overrideProviders: overrideProviders) =
      await AppInitializer.initialize();
  runApp(
    ProviderScope(overrides: [...overrideProviders], child: const MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    ref.listen(appExceptionNotifierProvider, (_, appException) {
      if (appException != null) {
        SnackBarManager.showSnackBar(
          'An error occurred: ${appException.message}',
        );
        ref.read(appExceptionNotifierProvider.notifier).consume();
      }
    });

    return MaterialApp.router(routerConfig: router);
  }
}
