import 'package:features_remote_config/remote_config.dart';
import 'package:features_remote_config/src/presentation/states/app_store_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/dependencies.dart';

class UpdateDialog extends ConsumerWidget {
  const UpdateDialog({
    super.key,
    this.title = 'Update Required',
    this.message =
        'Please update to the latest version to continue using the app.',
    this.updateButtonText = 'Update Now',
    this.laterButtonText = 'Later',
  });

  final String title;
  final String message;
  final String updateButtonText;
  final String laterButtonText;

  static Future<void> show(
    BuildContext context, {
    String title = 'Update Required',
    String message =
        'Please update to the latest version to continue using the app.',
    String updateButtonText = 'Update Now',
    String laterText = 'Later',
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => UpdateDialog(
            title: title,
            message: message,
            updateButtonText: updateButtonText,
            laterButtonText: laterText,
          ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateType = ref.watch(updateTypeProvider);
    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.system_update, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
        actions: [
          if (updateType == UpdateType.recommended)
            TextButton(
              onPressed: () => context.pop(),
              child: Text(laterButtonText),
            ),
          ElevatedButton(
            onPressed: () {
              ref.read(appStoreNotifierProvider.notifier).openAppStore();
            },
            child: Text(updateButtonText),
          ),
        ],
      ),
    );
  }
}
