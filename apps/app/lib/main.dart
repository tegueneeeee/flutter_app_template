import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/env/firebase_options.dart';
import 'package:flutter_app/core/env/flavor.dart';
import 'package:flutter_app/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptionsWithFlavor(Flavor.prod));
  runApp(const App());
}
