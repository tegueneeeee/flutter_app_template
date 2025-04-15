import 'package:features_remote_config/remote_config.dart';
import 'package:flutter/material.dart';
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
                    .read(remoteConfigNotifierProvider.notifier)
                    .updateMaintenance(value: false);
              },
              child: const Text('Maintenance Button'),
            ),
          ],
        ),
      ),
    );
  }
}
