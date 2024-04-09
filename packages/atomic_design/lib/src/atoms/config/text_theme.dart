import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTextTheme = GoogleFonts.robotoTextTheme(
  ThemeData(brightness: Brightness.light).textTheme,
).copyWith();

final darkTextTheme = GoogleFonts.robotoTextTheme(
  ThemeData(brightness: Brightness.dark).textTheme,
).copyWith();
