import 'package:flutter/material.dart';
import 'package:i18n/src/locale_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    } on Exception catch (error, stackTrace) {
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

  /// Convenience method to set Korean locale
  Future<void> setKorean() async {
    await setLocale(const Locale('ko'));
  }
}
