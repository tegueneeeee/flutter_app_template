import 'dart:async';

import 'package:core/exception.dart';
import 'package:core/state.dart';
import 'package:core/util.dart';
import 'package:features_force_update/force_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app_startup.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
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
          ref.read(appExceptionStateNotifierProvider.notifier).consume();
        }
      })
      ..listen(forceUpdateNotifierProvider, (_, forceUpdateState) {
        forceUpdateState.whenOrNull(
          data: (data) {
            final isUpdateNeeded = data.isUpdateNeeded;
            if (isUpdateNeeded) {
              SnackBarManager.showSnackBar(
                'isUpdateNeeded: ${data.isUpdateNeeded}',
              );
              // ForceUpdateDialog.show(context);
              // print('forceUpdateState: $forceUpdateState');
              ref.read(forceUpdateNotifierProvider.notifier).resume();
            }
          },
        );
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
