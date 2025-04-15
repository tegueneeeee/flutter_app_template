import 'package:core/keys.dart';
import 'package:flutter/material.dart' as material show showDialog;
import 'package:flutter/material.dart' hide showDialog;

class DialogManager {
  static Future<T?> showDialog<T>({
    required Widget dialog,
    bool barrierDismissible = true,
  }) {
    final navigatorState = GlobalKeys.rootNavigatorKey.currentState;
    if (navigatorState == null) {
      return Future.value();
    }

    return material.showDialog<T>(
      context: navigatorState.context,
      barrierDismissible: barrierDismissible,
      builder: (context) => dialog,
    );
  }

  static Future<void> showAlert({
    required String message,
    String title = '',
    String confirmText = '확인',
    VoidCallback? onConfirm,
  }) {
    return showDialog(
      dialog: AlertDialog(
        title: title.isNotEmpty ? Text(title) : null,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              GlobalKeys.rootNavigatorKey.currentState?.pop();
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  static Future<bool?> showConfirm({
    required String message,
    String title = '',
    String confirmText = '확인',
    String cancelText = '취소',
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog<bool>(
      dialog: AlertDialog(
        title: title.isNotEmpty ? Text(title) : null,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              GlobalKeys.rootNavigatorKey.currentState?.pop(false);
              onCancel?.call();
            },
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () {
              GlobalKeys.rootNavigatorKey.currentState?.pop(true);
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
}
