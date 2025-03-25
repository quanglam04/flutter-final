import 'package:flutter/material.dart';
import '../../presentation/resources/theme_data.dart';

extension ThemeDataExtensions on ThemeData {
  static AppThemeData lightTheme = AppThemeData();
  static AppThemeData darkTheme = AppThemeData();

  void addOwn(Brightness brightness, AppThemeData themeData) {
    if (brightness == Brightness.light) {
      lightTheme = themeData;
    } else {
      darkTheme = themeData;
    }
  }

  static AppThemeData empty = AppThemeData();

  AppThemeData own() {
    AppThemeData? themeData;
    if (brightness == Brightness.light) {
      themeData = lightTheme;
    } else {
      themeData = darkTheme;
    }
    return themeData;
  }
}