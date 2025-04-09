import 'package:features_webview/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/debug_mode/ui/debug_page.dart';
import 'package:flutter_app/features/debug_mode/ui/navigation_debug_page.dart';
import 'package:flutter_app/features/maintenance/state/maintenance_mode_notifier.dart';
import 'package:flutter_app/features/maintenance/ui/maintenance_page.dart';
import 'package:flutter_app/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package:flutter_app/router/routes/debug_page_route.dart';
part 'package:flutter_app/router/routes/main/home/home_shell_branch.dart';
part 'package:flutter_app/router/routes/main/home/web_page_route.dart';
part 'package:flutter_app/router/routes/main/main_page_shell_route.dart';
part 'package:flutter_app/router/routes/main/setting/setting_shell_branch.dart';
part 'package:flutter_app/router/routes/maintenance_page_route.dart';
part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final maintenanceMode = ref.watch(maintenanceModeNotifierProvider);
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      ...$appRoutes.where((route) {
        if (route is GoRoute) {
          return route.path != DebugPageRoute.path;
        }
        return true;
      }),
      if (kDebugMode) $debugPageRoute,
    ],
    debugLogDiagnostics: kDebugMode,
    initialLocation: HomePageRoute.path,
    redirect: (_, __) {
      if (maintenanceMode) {
        return MaintenancePageRoute.path;
      }
      return null;
    },
  );
}
