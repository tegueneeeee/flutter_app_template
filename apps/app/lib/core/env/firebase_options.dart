import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_app/core/env/firebase_options_dev.dart' as dev;
// import 'package:flutter_app/core/env/firebase_options_dev.dart' as prod;
// import 'package:flutter_app/core/env/firebase_options_dev.dart' as stg;
import 'package:flutter_app/core/env/flavor.dart';

FirebaseOptions firebaseOptionsWithFlavor(Flavor flavor) {
  switch (flavor) {
    // case Flavor.dev:
    //   return dev.DefaultFirebaseOptions.currentPlatform;
    // case Flavor.stg:
    //   return stg.DefaultFirebaseOptions.currentPlatform;
    // case Flavor.prod:
    //   return prod.DefaultFirebaseOptions.currentPlatform;
    default:
      throw UnimplementedError('Unimplemented flavor $flavor');
  }
}
