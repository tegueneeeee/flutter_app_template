import 'package:flutter/material.dart';

class GlobalKeys {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
}
