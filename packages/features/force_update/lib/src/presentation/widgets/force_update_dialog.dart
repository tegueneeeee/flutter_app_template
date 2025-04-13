import 'package:flutter/material.dart';

class ForceUpdateDialog extends StatelessWidget {
  const ForceUpdateDialog({
    super.key,
    this.title = 'Update Required',
    this.message =
        'Please update to the latest version to continue using the app.',
    this.updateButtonText = 'Update Now',
    this.onUpdatePressed,
  });

  final String title;
  final String message;
  final String updateButtonText;
  final VoidCallback? onUpdatePressed;

  static Future<void> show(
    BuildContext context, {
    String title = 'Update Required',
    String message =
        'Please update to the latest version to continue using the app.',
    String updateButtonText = 'Update Now',
    VoidCallback? onUpdatePressed,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => ForceUpdateDialog(
            title: title,
            message: message,
            updateButtonText: updateButtonText,
            onUpdatePressed: onUpdatePressed,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          ElevatedButton(
            onPressed: onUpdatePressed ?? () {},
            child: Text(updateButtonText),
          ),
        ],
      ),
    );
  }
}
