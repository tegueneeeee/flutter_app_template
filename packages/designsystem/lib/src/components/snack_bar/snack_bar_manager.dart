import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Manages the display of snack bars throughout the application
class SnackBarManager {
  SnackBarManager._();

  /// Shows a snack bar with the provided message
  static void showSnackBar(String message) {
    if (GlobalKeys.rootScaffoldMessengerKey.currentState == null) {
      return;
    }

    /// Hide the current snackBar if it is visible
    GlobalKeys.rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    GlobalKeys.rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Hides the currently displayed snack bar
  static void hideSnackBar() {
    if (GlobalKeys.rootScaffoldMessengerKey.currentState == null) {
      return;
    }
    GlobalKeys.rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
