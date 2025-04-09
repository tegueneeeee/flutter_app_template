import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page.g.dart';

abstract interface class HomePageNavigator {
  void navigateToWebPage(BuildContext context);
}

@riverpod
HomePageNavigator homePageNavigator(Ref ref) => throw UnimplementedError();

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = ref.watch(homePageNavigatorProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        actions: [
          IconButton(
            onPressed: () {
              navigator.navigateToWebPage(context);
            },
            icon: const Icon(Icons.web),
          ),
        ],
      ),
      body: const Center(child: Text('home')),
    );
  }
}
