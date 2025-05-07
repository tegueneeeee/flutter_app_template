part of 'package:flutter_app/router/router.dart';

@TypedGoRoute<MaintenancePageRoute>(path: MaintenancePageRoute.path)
class MaintenancePageRoute extends GoRouteData {
  const MaintenancePageRoute();

  static const path = '/maintenance';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage<Page<dynamic>>(
      child: Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Maintenance')),
      ),
    );
  }
}
