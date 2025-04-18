# Webview Feature

This package provides webview functionality for displaying web content within the app.

## Features

- Display web content in a WebView component
- Handle loading states and errors
- Navigate back and forward
- Support for URL validation and whitelisting
- Progress indicator while loading

## Usage

```dart
import 'package:features_webview/webview.dart';

// Use the WebPage widget in your app
WebPage(
  initialUrl: 'https://flutter.dev',
  onPop: () => Navigator.of(context).pop(),
  title: 'Flutter Website',
)
```

## Structure

This package follows Clean Architecture principles:

- **Domain**: Contains business logic and interfaces
  - Entities: WebUrl
  - Repositories: WebviewRepository (interface)
  - Use Cases: LoadWebUrlUseCase

- **Data**: Contains data sources and repository implementations
  - Models: WebUrlModel
  - Repositories: WebviewRepositoryImpl

- **Presentation**: Contains UI components and state management
  - Pages: WebPage
  - States: Various Riverpod providers for state management

## Dependencies

- webview_flutter: For displaying web content
- flutter_riverpod: For state management
- core: For common interfaces and utilities
