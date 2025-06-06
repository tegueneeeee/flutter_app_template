import 'dart:async';

import 'package:core/core.dart';
import 'package:designsystem/designsystem.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app_providers.dart';
import 'package:flutter_app/app_startup.dart';
import 'package:flutter_app/fake_providers.dart';
import 'package:flutter_app/router/router.dart';
import 'package:shared_dependencies/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final fakeProviders =
      await (kDebugMode
          ? FakeProviders.initialize()
          : Future.value(<Override>[]));
  final appProviders = await AppProviders.initialize();
  runApp(
    ProviderScope(
      overrides: [...fakeProviders, ...appProviders],
      child: AppStartupWidget(onLoaded: (_) => const MainApp()),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    ref
      ..listen(appExceptionNotifierProvider, (_, appException) {
        if (appException != null) {
          SnackBarManager.showSnackBar(appException.message);
          ref.read(appExceptionNotifierProvider.notifier).consume();
        }
      })
      ..listen(updateTypeProvider, (_, updateType) {
        if (updateType == UpdateType.none) return;
        DialogManager.showDialog<void>(dialog: const UpdateDialog());
      });

    return MaterialApp.router(
      routerConfig: router,
      scaffoldMessengerKey: GlobalKeys.rootScaffoldMessengerKey,
      shortcuts:
          kDebugMode
              ? {
                LogicalKeySet(
                      LogicalKeyboardKey.shift,
                      LogicalKeyboardKey.keyZ,
                    ):
                    const _PopIntent(),
              }
              : null,
      actions:
          kDebugMode
              ? <Type, Action<Intent>>{
                _PopIntent: CallbackAction<_PopIntent>(
                  onInvoke: (_) {
                    if (router.canPop()) router.pop();
                    return null;
                  },
                ),
              }
              : null,
    );
  }
}

class _PopIntent extends Intent {
  const _PopIntent();
}
