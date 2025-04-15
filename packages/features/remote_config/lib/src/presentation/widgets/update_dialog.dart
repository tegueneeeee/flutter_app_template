import 'package:flutter/material.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    required this.onUpdatePressed,
    this.onLaterPressed,
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
  final VoidCallback onUpdatePressed;
  final VoidCallback? onLaterPressed;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onUpdatePressed,
    VoidCallback? onLaterPressed,
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
            onUpdatePressed: onUpdatePressed,
            onLaterPressed: onLaterPressed,
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
          if (onLaterPressed != null)
            TextButton(onPressed: onLaterPressed, child: Text(laterButtonText)),
          ElevatedButton(
            onPressed: onUpdatePressed,
            child: Text(updateButtonText),
          ),
        ],
      ),
    );
  }
}
