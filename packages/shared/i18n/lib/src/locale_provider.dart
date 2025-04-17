import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'locale_service.dart';

part 'locale_provider.g.dart';

/// Provider for the application locale
@Riverpod(keepAlive: true)
class AppLocale extends _$AppLocale {
  @override
  Future<Locale> build() async {
    // Initialize with stored locale or default
    return LocaleService.getCurrentLocale();
  }

  /// Set locale and persist the change
  Future<void> setLocale(Locale locale) async {
    state = const AsyncValue.loading();
    try {
      await LocaleService.setLocale(locale);
      state = AsyncValue.data(locale);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Convenience method to set English locale
  Future<void> setEnglish() async {
    await setLocale(const Locale('en'));
  }

  /// Convenience method to set Japanese locale
  Future<void> setJapanese() async {
    await setLocale(const Locale('ja'));
  }
}
