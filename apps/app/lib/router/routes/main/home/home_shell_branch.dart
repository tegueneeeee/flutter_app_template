part of 'package:flutter_app/router/router.dart';

const homeShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomePageRoute>(
      path: HomePageRoute.path,
      routes: [TypedGoRoute<WebPageRoute>(path: WebPageRoute.path)],
    ),
  ],
);

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage(navigateToWebPage: () => const WebPageRoute().go(context));
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({required this.navigateToWebPage, super.key});

  final VoidCallback navigateToWebPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        actions: [
          IconButton(
            onPressed: navigateToWebPage,
            icon: const Icon(Icons.web),
          ),
        ],
      ),
      body: const Center(child: Text('home')),
    );
  }
}
