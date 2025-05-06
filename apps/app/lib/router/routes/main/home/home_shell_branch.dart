part of 'package:flutter_app/router/router.dart';

const homeShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: [TypedGoRoute<HomePageRoute>(path: HomePageRoute.path)],
);

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar')),
      body: const Center(child: Text('home')),
    );
  }
}
