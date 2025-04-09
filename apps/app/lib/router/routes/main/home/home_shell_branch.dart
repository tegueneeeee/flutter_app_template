part of 'package:flutter_app/router/router.dart';

const homeShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomePageRoute>(
      path: HomePageRoute.path,
      routes: [TypedGoRoute<WebPageRoute>(path: WebPageRoute.path)],
    ),
  ],
);

final class _HomePageNavigatorImpl implements HomePageNavigator {
  const _HomePageNavigatorImpl();

  @override
  void navigateToWebPage(BuildContext context) {
    const WebPageRoute().go(context);
  }
}

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProviderScope(
      overrides: [
        homePageNavigatorProvider.overrideWithValue(
          const _HomePageNavigatorImpl(),
        ),
      ],
      child: const HomePage(),
    );
  }
}
