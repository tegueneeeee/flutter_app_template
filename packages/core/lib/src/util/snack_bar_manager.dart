import 'package:core/src/keys/global_keys.dart';
import 'package:flutter/material.dart';

class SnackBarManager {
  SnackBarManager._();

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

  static void hideSnackBar() {
    if (GlobalKeys.rootScaffoldMessengerKey.currentState == null) {
      return;
    }
    GlobalKeys.rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
