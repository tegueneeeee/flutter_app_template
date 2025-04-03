part of 'package:flutter_app/router/router.dart';

const settingShellBranch = TypedStatefulShellBranch<SettingShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingPageRoute>(path: SettingPageRoute.path),
  ],
);

class SettingShellBranch extends StatefulShellBranchData {
  const SettingShellBranch();
}

class SettingPageRoute extends GoRouteData {
  const SettingPageRoute();

  static const path = '/setting';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold();
  }
}
