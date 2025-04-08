import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_state.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferencesState(Ref ref) =>
    SharedPreferences.getInstance();
