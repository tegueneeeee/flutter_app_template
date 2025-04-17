import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for managing application locale
class LocaleService {
  LocaleService._();

  /// Storage key for the locale preference
  static const String _localeKey = 'app_locale';

  /// List of supported locales in the application
  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('ja'), // Japanese
    Locale('ko'), // Korean
  ];

  /// Default locale for the application
  static const Locale defaultLocale = Locale('en');

  /// Retrieves the current locale from storage
  static Future<Locale> getCurrentLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeString = prefs.getString(_localeKey);

    if (localeString == null) {
      return defaultLocale;
    }

    try {
      final localeParts = localeString.split('_');
      if (localeParts.length == 1) {
        return Locale(localeParts[0]);
      } else if (localeParts.length > 1) {
        return Locale(localeParts[0], localeParts[1]);
      }
    } on Exception catch (_) {
      // Return default locale on error
    }

    return defaultLocale;
  }

  /// Saves the locale preference to storage
  static Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    final localeString =
        locale.countryCode != null
            ? '${locale.languageCode}_${locale.countryCode}'
            : locale.languageCode;

    await prefs.setString(_localeKey, localeString);
  }

  /// Returns a human-readable name for the language
  static String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ja':
        return '日本語';
      case 'ko':
        return '한국어';
      default:
        return 'English';
    }
  }
}
