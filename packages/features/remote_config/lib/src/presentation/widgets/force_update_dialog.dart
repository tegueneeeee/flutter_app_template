import 'package:flutter/material.dart';

class ForceUpdateDialog extends StatelessWidget {
  const ForceUpdateDialog({
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
          (context) => ForceUpdateDialog(
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

// /// 권장 업데이트 다이얼로그 표시 (취소 가능)
//   static Future<bool?> showRecommendUpdate({
//     required Widget content,
//     String updateText = '업데이트',
//     String laterText = '나중에',
//     VoidCallback? onUpdatePressed,
//     VoidCallback? onLaterPressed,
//   }) {
//     return showDialog<bool>(
//       dialog: AlertDialog(
//         content: content,
//         actions: [
//           TextButton(
//             onPressed: () {
//               GlobalKeys.rootNavigatorKey.currentState?.pop(false);
//               onLaterPressed?.call();
//             },
//             child: Text(laterText),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               GlobalKeys.rootNavigatorKey.currentState?.pop(true);
//               onUpdatePressed?.call();
//             },
//             child: Text(updateText),
//           ),
//         ],
//       ),
//     );
//   }
