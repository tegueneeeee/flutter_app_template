import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package:flutter_app/router/routes/main/home/home_shell_branch.dart';
part 'package:flutter_app/router/routes/main/main_page_shell_route.dart';
part 'package:flutter_app/router/routes/main/setting/setting_shell_branch.dart';
part 'package:flutter_app/router/routes/maintenance_page_route.dart';
part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final maintenance = ref.watch(maintenanceProvider);
  return GoRouter(
    navigatorKey: GlobalKeys.rootNavigatorKey,
    routes: [...$appRoutes],
    debugLogDiagnostics: kDebugMode,
    initialLocation: HomePageRoute.path,
    redirect: (_, __) {
      if (maintenance) {
        return MaintenancePageRoute.path;
      }
      return null;
    },
  );
}
