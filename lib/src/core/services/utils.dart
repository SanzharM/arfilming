import 'package:flutter/material.dart';

class Utils {
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const Duration delayDuration = Duration(milliseconds: 500);

  static ThemeMode getThemeMode(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
