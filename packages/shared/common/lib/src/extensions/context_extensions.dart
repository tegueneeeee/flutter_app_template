import 'package:flutter/material.dart';

/// Extensions on BuildContext to provide convenient access to common properties and methods
extension BuildContextExtensions on BuildContext {
  /// Get the current theme
  ThemeData get theme => Theme.of(this);

  /// Get the color scheme from the current theme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get the current text theme
  TextTheme get textTheme => theme.textTheme;

  /// Get the primary color
  Color get primaryColor => theme.primaryColor;

  /// Get the media query data
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the screen size
  Size get screenSize => mediaQuery.size;

  /// Get the screen width
  double get screenWidth => screenSize.width;

  /// Get the screen height
  double get screenHeight => screenSize.height;

  /// Get the safe area insets
  EdgeInsets get padding => mediaQuery.padding;

  /// Get the top padding (status bar height)
  double get topPadding => padding.top;

  /// Get the bottom padding (bottom safe area, e.g., home indicator)
  double get bottomPadding => padding.bottom;

  /// Get the keyboard height
  double get keyboardHeight => mediaQuery.viewInsets.bottom;

  /// Check if the keyboard is visible
  bool get isKeyboardVisible => keyboardHeight > 0;

  /// Get the device orientation
  Orientation get orientation => mediaQuery.orientation;

  /// Check if the device is in portrait orientation
  bool get isPortrait => orientation == Orientation.portrait;

  /// Check if the device is in landscape orientation
  bool get isLandscape => orientation == Orientation.landscape;

  /// Get the device pixel ratio
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  /// Get the text scale factor
  double get textScaleFactor => mediaQuery.textScaleFactor;

  /// Get the nearest scaffold
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Get the nearest scaffold messenger
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Show a snackbar
  void showSnackBar(SnackBar snackBar) {
    scaffoldMessenger.showSnackBar(snackBar);
  }

  /// Show a simple text snackbar
  void showTextSnackBar(
    String text, {
    Duration duration = const Duration(seconds: 4),
    Color? backgroundColor,
  }) {
    showSnackBar(
      SnackBar(
        content: Text(text),
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Show a material banner
  void showMaterialBanner(MaterialBanner materialBanner) {
    scaffoldMessenger.showMaterialBanner(materialBanner);
  }

  /// Pop the current route from the navigation stack
  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Navigate to a new route
  Future<T?> push<T>(Route<T> route) {
    return Navigator.of(this).push(route);
  }

  /// Navigate to a new named route
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  /// Replace the current route with a new route
  Future<T?> pushReplacement<T, TO>(Route<T> route, {TO? result}) {
    return Navigator.of(this).pushReplacement<T, TO>(route, result: result);
  }

  /// Replace the current named route with a new named route
  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// Navigate to a new route and remove all previous routes
  Future<T?> pushAndRemoveUntil<T>(Route<T> route, RoutePredicate predicate) {
    return Navigator.of(this).pushAndRemoveUntil<T>(route, predicate);
  }

  /// Navigate to a new named route and remove all previous routes
  Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil<T>(routeName, predicate, arguments: arguments);
  }

  /// Pop until a specific route
  void popUntil(RoutePredicate predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  /// Show a dialog
  Future<T?> showDialog<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return Flutter.showDialog<T>(
      context: this,
      builder: builder,
      barrierDismissible: barrierDismissible,
    );
  }

  /// Show a modal bottom sheet
  Future<T?> showModalBottomSheet<T>({
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return Flutter.showModalBottomSheet<T>(
      context: this,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }

  /// Check if the current theme is dark
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Check if the device is a mobile phone (small screen)
  bool get isMobile => screenWidth < 600;

  /// Check if the device is a tablet (medium screen)
  bool get isTablet => screenWidth >= 600 && screenWidth < 900;

  /// Check if the device is a desktop (large screen)
  bool get isDesktop => screenWidth >= 900;

  /// Get the locale of the app
  Locale get locale => Localizations.localeOf(this);

  /// Get the text direction (LTR or RTL)
  TextDirection get textDirection => Directionality.of(this);

  /// Check if the text direction is RTL
  bool get isRtl => textDirection == TextDirection.rtl;

  /// Get a responsive value based on screen size
  T responsive<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop) {
      return desktop ?? tablet ?? mobile;
    }
    if (isTablet) {
      return tablet ?? mobile;
    }
    return mobile;
  }

  /// Get the focus scope node
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Hide the keyboard
  void hideKeyboard() {
    if (isKeyboardVisible) {
      focusScope.unfocus();
    }
  }
}

/// Creating a namespace to avoid naming conflicts with context extension methods
class Flutter {
  Flutter._();

  /// Show a dialog
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
    );
  }

  /// Show a modal bottom sheet
  static Future<T?> showModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );
  }
}
