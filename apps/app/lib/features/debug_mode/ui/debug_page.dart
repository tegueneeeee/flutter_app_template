import 'package:flutter/material.dart';
import 'package:flutter_app/features/debug_mode/state/exception_generator_notifier.dart';
import 'package:flutter_app/features/maintenance/state/maintenance_mode_notifier.dart';
import 'package:flutter_app/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Mode')),
      body: Center(
        child: Column(
          children: [
            _FixSizedElevatedButton(
              title: 'Show error SnackBar ',
              onPressed: () {
                ref.read(exceptionGeneratorNotifierProvider.notifier).request();
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable maintenance mode',
              onPressed: () {
                ref
                    .read(maintenanceModeNotifierProvider.notifier)
                    .update(enabled: true);
              },
            ),
            _FixSizedElevatedButton(
              title: 'Enable force update',
              onPressed: () {
                // ref
                //     .read(forceUpdateTargetVersionNotifierProvider.notifier)
                //     .update(
                //       androidTargetVersion: VersionString('9.9.9'),
                //       iosTargetVersion: VersionString('9.9.9'),
                //     );
              },
            ),
            _FixSizedElevatedButton(
              title: 'Go navigation debug page',
              onPressed: () {
                const NavigationDebugPageRoute().push<void>(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FixSizedElevatedButton extends StatelessWidget {
  const _FixSizedElevatedButton({required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }
}
