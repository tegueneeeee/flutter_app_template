import 'package:flutter/material.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        actions: [
          IconButton(
            onPressed: () {
              context.go(const DebugPageRoute().location);
            },
            icon: const Icon(Icons.web),
          ),
        ],
      ),
      body: const Center(child: Text('home')),
    );
  }
}
