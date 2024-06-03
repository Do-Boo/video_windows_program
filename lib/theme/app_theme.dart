import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    hintColor: const Color.fromARGB(255, 15, 15, 15),
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.cyan),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 15, 15, 15),
    scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 15),
    hintColor: Colors.white,
    colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.red),
  ),
};
