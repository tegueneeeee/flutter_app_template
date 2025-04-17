import 'dart:async';

import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  runApp(
    ProviderScope(
      overrides: [...fakeProviders],
      observers: [AsyncErrorLogger()],
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
      ..listen(appExceptionStateNotifierProvider, (_, appException) {
        if (appException != null) {
          SnackBarManager.showSnackBar(appException.message);
          ref.read(appExceptionStateNotifierProvider.notifier).consume();
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
                      LogicalKeyboardKey.keyD,
                    ):
                    const _DebugIntent(),
                LogicalKeySet(
                      LogicalKeyboardKey.shift,
                      LogicalKeyboardKey.keyZ,
                    ):
                    const _PopIntent(),
                LogicalKeySet(
                      LogicalKeyboardKey.shift,
                      LogicalKeyboardKey.keyM,
                    ):
                    const _MaintenanceIntent(),
              }
              : null,
      actions:
          kDebugMode
              ? <Type, Action<Intent>>{
                _DebugIntent: CallbackAction<_DebugIntent>(
                  onInvoke: (_) {
                    if (!router.state.matchedLocation.startsWith(
                      const DebugPageRoute().location,
                    )) {
                      router.push(const DebugPageRoute().location);
                    }
                    return null;
                  },
                ),
                _PopIntent: CallbackAction<_PopIntent>(
                  onInvoke: (_) {
                    if (router.canPop()) router.pop();
                    return null;
                  },
                ),
                _MaintenanceIntent: CallbackAction<_MaintenanceIntent>(
                  onInvoke: (_) {
                    ref
                        .read(remoteConfigNotifierProvider.notifier)
                        .toggleMaintenance();
                    return null;
                  },
                ),
              }
              : null,
    );
  }
}

class _DebugIntent extends Intent {
  const _DebugIntent();
}

class _PopIntent extends Intent {
  const _PopIntent();
}

class _MaintenanceIntent extends Intent {
  const _MaintenanceIntent();
}
