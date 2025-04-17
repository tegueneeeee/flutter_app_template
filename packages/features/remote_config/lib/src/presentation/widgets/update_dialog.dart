import 'package:designsystem/designsystem.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:features_remote_config/src/presentation/states/app_store_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/dependencies.dart';

/// A dialog that prompts the user to update the app
class UpdateDialog extends ConsumerWidget {
  /// Constructor
  const UpdateDialog({
    super.key,
    this.title = 'Update Required',
    this.message =
        'Please update to the latest version to continue using the app.',
    this.updateButtonText = 'Update Now',
    this.laterButtonText = 'Later',
  });

  /// The title of the dialog
  final String title;

  /// The message to display in the dialog
  final String message;

  /// The text for the update button
  final String updateButtonText;

  /// The text for the later button
  final String laterButtonText;

  /// Shows the update dialog
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return PopScope(
      canPop: updateType != UpdateType.force,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Icon(Icons.system_update, size: 80, color: colorScheme.primary),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        actions: [
          if (updateType != UpdateType.force)
            AppButton.tertiary(
              label: laterButtonText,
              onPressed: () => context.pop(),
              fullWidth: true,
            ),
          const SizedBox(height: 8),
          AppButton.primary(
            label: updateButtonText,
            onPressed: () {
              ref.read(appStoreNotifierProvider.notifier).openAppStore();
            },
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
