import 'dart:async';

import 'package:core/log.dart';
import 'package:core/state.dart';
import 'package:core/util.dart';
import 'package:features_force_update/force_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_config/config.dart';

part 'main.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref.invalidate(appBuildConfigStateProvider);
  });
  // all asynchronous app initialization code should belong here:
  await ref.watch(appBuildConfigStateProvider.future);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      child: AppStartupWidget(onLoaded: (_) => const MainApp()),
    ),
  );
}

class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({required this.onLoaded, super.key});
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. eagerly initialize appStartupProvider (and all the providers it depends on)
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      // 3. loading state
      loading: () => const AppStartupLoadingWidget(),
      // 4. error state
      error:
          (e, st) => AppStartupErrorWidget(
            message: e.toString(),
            // 5. invalidate the appStartupProvider
            onRetry: () => ref.invalidate(appStartupProvider),
          ),
      // 6. success - now load the main app
      data: (_) => onLoaded(context),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    required this.message,
    required this.onRetry,
    super.key,
  });
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message, style: Theme.of(context).textTheme.headlineSmall),
              const Gap(16),
              ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ),
        ),
      ),
    );
  }
}

class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
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
              logger.finest('forceUpdateState: $forceUpdateState');
              logger.finer('forceUpdateState: $forceUpdateState');
              logger.fine('forceUpdateState: $forceUpdateState');
              logger.config('forceUpdateState: $forceUpdateState');
              logger.info('forceUpdateState: $forceUpdateState');
              logger.warning('forceUpdateState: $forceUpdateState');
              logger.severe('forceUpdateState: $forceUpdateState');
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
