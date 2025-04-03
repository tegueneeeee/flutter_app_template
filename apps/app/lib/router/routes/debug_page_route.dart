part of 'package:flutter_app/router/router.dart';

@TypedGoRoute<DebugPageRoute>(path: DebugPageRoute.path)
class DebugPageRoute extends GoRouteData {
  const DebugPageRoute();

  static const path = '/debug';

  static final $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DebugPage();
  }
}
