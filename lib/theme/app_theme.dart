import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.cyan),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 16, 16, 16),
    scaffoldBackgroundColor: const Color.fromARGB(255, 16, 16, 16),
    colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.red),
  ),
};
