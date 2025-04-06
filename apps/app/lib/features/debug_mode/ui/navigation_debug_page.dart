import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;

class NavigationDebugPage extends ConsumerWidget {
  const NavigationDebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: Text('Debug Page')),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: _RouteDropdownMenu(),
            ),
          ),
        ],
      ),
    );
  }
}

class _RouteDropdownMenu extends HookWidget {
  const _RouteDropdownMenu();

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final routeBases = router.configuration.routes;
    final dropdownMenuEntries = useMemoized(() {
      final paths = routeBases.toPaths();
      return paths
          .map((path) {
            if (path.contains('debug')) {
              return null;
            }
            return DropdownMenuEntry<String>(value: path, label: path);
          })
          .nonNulls
          .toList();
      },
      routeBases,
    );
    final pathEditController = useTextEditingController();
    return Column(
      children: [
        DropdownMenu(
          dropdownMenuEntries: dropdownMenuEntries,
          expandedInsets: EdgeInsets.zero,
          onSelected: (path) {
            if (path == null) {
              return;
            }
            pathEditController.text = path;
          },
        ),
        const Gap(16),
        TextField(
          controller: pathEditController,
          decoration: const InputDecoration(
            label: Text('Path'),
            border: OutlineInputBorder(),
          ),
          maxLines: 2,
        ),
        const Gap(16),
        ElevatedButton(
          onPressed: () {
            final path = pathEditController.text;
            router.go(path);
          },
          child: const Text('Go'),
        ),
      ],
    );
  }
}

extension _ToPaths on List<RouteBase> {
  List<String> toPaths([String? parentPath]) {
    final routes = <String>[];
    for (final routeBase in this) {
      switch (routeBase) {
        case GoRoute():
          var path = routeBase.path;
          if (parentPath != null) {
            path = p.join(parentPath, path);
          }

          routes.add(path);

          final childRouteBases = routeBase.routes;
          if (childRouteBases.isNotEmpty) {
            routes.addAll(childRouteBases.toPaths(path));
          }
        case ShellRoute() || StatefulShellRoute():
          routes.addAll(routeBase.routes.toPaths());
      }
    }
    return routes;
  }
}
