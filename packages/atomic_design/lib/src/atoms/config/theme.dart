import 'package:designsystem/src/atoms/config/color_scheme.dart';
import 'package:designsystem/src/atoms/config/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme => _createTheme(
      colorScheme: lightColorScheme,
      textTheme: lightTextTheme,
    );
ThemeData get darkTheme => _createTheme(
      colorScheme: darkColorScheme,
      textTheme: darkTextTheme,
    );

ThemeData _createTheme({
  required ColorScheme colorScheme,
  required TextTheme textTheme,
}) =>
    ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
