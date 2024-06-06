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
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Color.fromARGB(255, 15, 15, 15),
      secondary: Colors.cyan,
      onSurface: Color.fromARGB(255, 15, 15, 15),
    ),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 15, 15, 15),
    scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 15),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 15, 15, 15),
      onPrimary: Colors.white,
      secondary: Colors.red,
      onSurface: Colors.white,
    ),
  ),
};
