import 'package:atw_task/Core/utilts/Colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData getLightThemeData() {
    return ThemeData(
      primaryColor: ColorApp.primaryColor,
      primaryColorLight: ColorApp.blackColor10,
      primaryColorDark: Colors.white,
      scaffoldBackgroundColor: ColorApp.mainLight,
      textTheme: const TextTheme(
        titleSmall: TextStyle(
          color: Colors.black45,
          fontFamily: 'Flexo',
        ),
        titleLarge: TextStyle(
          color: ColorApp.blackColor,
          fontFamily: 'Flexo',
        ),
        bodyLarge: TextStyle(
          color: ColorApp.mainLight,
          fontWeight: FontWeight.bold,
          fontFamily: 'Flexo',
        ),
        bodyMedium: TextStyle(
          color: ColorApp.blackColor,
          fontFamily: 'Flexo',
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          fontFamily: 'Flexo',
        ),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primaryColor),
      useMaterial3: true,
    );
  }
}
