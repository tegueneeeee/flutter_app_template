import 'package:flutter/material.dart';
import 'package:flutter_app/features/maintenance/data/maintenance_mode_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MaintenancePage extends ConsumerWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maintenance')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Maintenance Description'),
            const Gap(64),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(maintenanceModeNotifierProvider.notifier)
                    .update(enabled: false);
              },
              child: const Text('Maintenance Button'),
            ),
          ],
        ),
      ),
    );
  }
}
