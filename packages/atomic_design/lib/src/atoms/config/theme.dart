import 'package:designsystem/src/atoms/config/color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme => _createTheme(
      colorScheme: lightColorScheme,
    );
ThemeData get darkTheme => _createTheme(
      colorScheme: darkColorScheme,
    );

ThemeData _createTheme({
  required ColorScheme colorScheme,
}) =>
    ThemeData(
      colorScheme: colorScheme,
    );
