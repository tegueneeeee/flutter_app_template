# i18n

Flutter internationalization package using slang.

## Overview

This package provides internationalization functionality for the Flutter application. It uses slang for type-safe translations and Riverpod for state management.

## Features

- Type-safe access to translations
- Support for English and Japanese languages
- Locale persistence using SharedPreferences
- Riverpod providers for easy locale management

## Getting Started

### Add the Package

```yaml
dependencies:
  i18n:
    path: packages/shared/i18n
```

### Use in Your App

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n/i18n.dart';
import 'package:slang_flutter/slang_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleProvider).valueOrNull ?? 
                  LocaleService.defaultLocale;
    
    return MaterialApp(
      locale: locale,
      supportedLocales: LocaleService.supportedLocales,
      localizationsDelegates: const [
        TranslationDelegate(),
      ],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access translations
    final t = Translations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(t.app.title),
      ),
      body: Center(
        child: Text(t.app.welcome),
      ),
    );
  }
}
```

### Change Locale

```dart
// Using provider
ref.read(appLocaleProvider.notifier).setLocale(const Locale('ja'));

// Convenience methods
ref.read(appLocaleProvider.notifier).setEnglish();
ref.read(appLocaleProvider.notifier).setJapanese();
```

## Generating Translations

Run the following command to generate translation files:

```bash
dart run melos gen:i18n
```

or watch for changes:

```bash
dart run melos gen:i18n:watch
```

## Adding New Translations

1. Add your translation key to `lib/src/translations/en/strings.json` (for English)
2. Add the same key to `lib/src/translations/ja/strings.json` (for Japanese)
3. Run `dart run melos gen:i18n` to generate the code

## Adding a New Language

1. Create a new directory under `lib/src/translations` with the locale code, e.g., `ko` for Korean
2. Add a `strings.json` file with all the same keys as the English version
3. Update `LocaleService.supportedLocales` to include the new locale
4. Add a convenience method to `AppLocaleProvider` if desired
5. Run `dart run melos gen:i18n` to generate the code
