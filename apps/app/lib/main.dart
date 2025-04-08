import 'dart:async';

import 'package:core/state.dart';
import 'package:core/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/features/force_update/state/force_update_mode_notifier.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(child: MainApp()),
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
          SnackBarManager.showSnackBar(
            'An error occurred: ${appException.message}',
          );
          ref.read(appExceptionStateNotifierProvider.notifier).consume();
        }
      })
      ..listen(forceUpdateModeNotifierProvider, (_, forceUpdateMode) {
        final forceUpdateModeEnabled = forceUpdateMode.enabled;
        if (forceUpdateModeEnabled) {
          SnackBarManager.showSnackBar('Force Update is required.');
          ref.read(forceUpdateModeNotifierProvider.notifier).disable();
        }
      });

    return MaterialApp.router(
      routerConfig: router,
      scaffoldMessengerKey: SnackBarManager.rootScaffoldMessengerKey,
      shortcuts:
          kDebugMode
              ? {
                LogicalKeySet(
                      LogicalKeyboardKey.shift,
                      LogicalKeyboardKey.keyD,
                    ):
                    const _DebugIntent(),
              }
              : null,
      actions:
          kDebugMode
              ? <Type, Action<Intent>>{
                _DebugIntent: CallbackAction<_DebugIntent>(
                  onInvoke:
                      (_) => unawaited(
                        router.push(const DebugPageRoute().location),
                      ),
                ),
              }
              : null,
    );
  }
}

class _DebugIntent extends Intent {
  const _DebugIntent();
}
