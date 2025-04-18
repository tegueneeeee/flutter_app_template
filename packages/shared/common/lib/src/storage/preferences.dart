import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// A wrapper around SharedPreferences to provide a more convenient API
/// and add some additional functionality like automatic JSON encoding/decoding.
class Preferences {
  Preferences._();

  static SharedPreferences? _prefs;

  /// Initialize the preferences instance.
  /// This should be called early in the app lifecycle, typically in main.dart.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Check if the preferences instance has been initialized.
  static bool get isInitialized => _prefs != null;

  /// Get the underlying SharedPreferences instance.
  /// This is useful if you need direct access to the SharedPreferences API.
  static SharedPreferences get instance {
    if (_prefs == null) {
      throw StateError(
        'Preferences not initialized. Call Preferences.init() first.',
      );
    }
    return _prefs!;
  }

  /// Clear all preferences.
  static Future<bool> clear() async {
    return instance.clear();
  }

  /// Remove a preference by key.
  static Future<bool> remove(String key) async {
    return instance.remove(key);
  }

  /// Check if a preference exists.
  static bool containsKey(String key) {
    return instance.containsKey(key);
  }

  /// Get all keys.
  static Set<String> getKeys() {
    return instance.getKeys();
  }

  /// Get a string preference.
  static String? getString(String key) {
    return instance.getString(key);
  }

  /// Set a string preference.
  static Future<bool> setString(String key, String value) async {
    return instance.setString(key, value);
  }

  /// Get a boolean preference.
  static bool? getBool(String key) {
    return instance.getBool(key);
  }

  /// Set a boolean preference.
  static Future<bool> setBool(String key, bool value) async {
    return instance.setBool(key, value);
  }

  /// Get an integer preference.
  static int? getInt(String key) {
    return instance.getInt(key);
  }

  /// Set an integer preference.
  static Future<bool> setInt(String key, int value) async {
    return instance.setInt(key, value);
  }

  /// Get a double preference.
  static double? getDouble(String key) {
    return instance.getDouble(key);
  }

  /// Set a double preference.
  static Future<bool> setDouble(String key, double value) async {
    return instance.setDouble(key, value);
  }

  /// Get a string list preference.
  static List<String>? getStringList(String key) {
    return instance.getStringList(key);
  }

  /// Set a string list preference.
  static Future<bool> setStringList(String key, List<String> value) async {
    return instance.setStringList(key, value);
  }

  /// Get a preference as a Map. This will decode a JSON string.
  static Map<String, dynamic>? getMap(String key) {
    final value = instance.getString(key);
    if (value == null) return null;

    try {
      return json.decode(value) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  /// Set a Map preference. This will encode the Map as a JSON string.
  static Future<bool> setMap(String key, Map<String, dynamic> value) async {
    return instance.setString(key, json.encode(value));
  }

  /// Get a preference as a List. This will decode a JSON string.
  static List<dynamic>? getList(String key) {
    final value = instance.getString(key);
    if (value == null) return null;

    try {
      return json.decode(value) as List<dynamic>;
    } catch (e) {
      return null;
    }
  }

  /// Set a List preference. This will encode the List as a JSON string.
  static Future<bool> setList(String key, List<dynamic> value) async {
    return instance.setString(key, json.encode(value));
  }

  /// Get a preference as a typed object. This requires a fromJson function.
  static T? getObject<T>(
    String key,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final map = getMap(key);
    if (map == null) return null;

    try {
      return fromJson(map);
    } catch (e) {
      return null;
    }
  }

  /// Set an object preference. This requires the object to have a toJson method.
  static Future<bool> setObject<T>(
    String key,
    T value,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    return setMap(key, toJson(value));
  }

  /// Get a preference as a typed list. This requires a fromJson function.
  static List<T>? getObjectList<T>(
    String key,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final list = getList(key);
    if (list == null) return null;

    try {
      return list
          .cast<Map<String, dynamic>>()
          .map((item) => fromJson(item))
          .toList();
    } catch (e) {
      return null;
    }
  }

  /// Set an object list preference. This requires the objects to have a toJson method.
  static Future<bool> setObjectList<T>(
    String key,
    List<T> value,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    final list = value.map((item) => toJson(item)).toList();
    return setList(key, list);
  }
}
