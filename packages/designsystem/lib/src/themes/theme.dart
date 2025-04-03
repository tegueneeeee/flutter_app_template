import 'package:designsystem/src/themes/app_bar_theme.dart';
import 'package:designsystem/src/themes/bottom_navigation_bar_theme.dart';
import 'package:designsystem/src/themes/color_schemes.dart';
import 'package:designsystem/theme_extensions.dart';
import 'package:flutter/material.dart';

/// Create a light theme.
ThemeData lightTheme({ColorScheme? colorScheme}) => _createTheme(
  colorScheme: colorScheme ?? lightColorScheme,
  appBarTheme: lightAppBarTheme,
  bottomNavigationBarTheme: lightBottomNavigationBarTheme,
  appColors: AppColors.light(),
);

/// Create a dark theme.
ThemeData darkTheme({ColorScheme? colorScheme}) => _createTheme(
  colorScheme: colorScheme ?? darkColorScheme,
  appBarTheme: darkAppBarTheme,
  bottomNavigationBarTheme: darkBottomNavigationBarTheme,
  appColors: AppColors.dark(),
);

ThemeData _createTheme({
  required ColorScheme colorScheme,
  required AppBarTheme appBarTheme,
  required BottomNavigationBarThemeData bottomNavigationBarTheme,
  required AppColors appColors,
}) => ThemeData(
  colorScheme: colorScheme,
  appBarTheme: appBarTheme,
  bottomNavigationBarTheme: bottomNavigationBarTheme,
  extensions: [appColors],
);
