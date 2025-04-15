import 'dart:async';

import 'package:core/exception.dart';
import 'package:core/keys.dart';
import 'package:core/state.dart';
import 'package:core/util.dart';
import 'package:features_force_update/force_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app_startup.dart';
import 'package:flutter_app/router/router.dart';
import 'package:shared_dependencies/dependencies.dart';

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
          DialogManager.showAlert(message: appException.message);
          ref.read(appExceptionStateNotifierProvider.notifier).consume();
        }
      })
      ..listen(forceUpdateNotifierProvider, (_, forceUpdateState) {
        forceUpdateState.whenOrNull(
          data: (data) {
            final isUpdateNeeded = data.isUpdateNeeded;
            if (isUpdateNeeded) {
              DialogManager.showDialog<void>(
                dialog: ForceUpdateDialog(
                  onUpdatePressed: () {
                    ref
                        .read(forceUpdateNotifierProvider.notifier)
                        .openAppStore();
                  },
                  onLaterPressed:
                      isUpdateNeeded
                          ? () {
                            GlobalKeys.rootNavigatorKey.currentState?.pop();
                            ref
                                .read(forceUpdateNotifierProvider.notifier)
                                .resume();
                          }
                          : null,
                ),
              );
            }
          },
        );
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
