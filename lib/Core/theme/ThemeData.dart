import 'package:atw_task/Core/utilts/Colors.dart';
import 'package:flutter/material.dart';

class ThemeApp{
  static ThemeData getLightThemeData() {
    return ThemeData(
      primaryColor: ColorApp.primaryColor,
      primaryColorLight: ColorApp.blackColor10,
      primaryColorDark: Colors.white,
      scaffoldBackgroundColor: ColorApp.mainLight,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: ColorApp.blackColor,
          fontSize: 38,
          fontWeight: FontWeight.bold
        ),
        headlineMedium: TextStyle(
          color: ColorApp.blackColor,
          fontSize: 28,
        ),
        titleSmall: TextStyle(
          color: ColorApp.mainLight,
        ),
        labelLarge: TextStyle(color: ColorApp.blackColor40),
        labelMedium: TextStyle(color: ColorApp.blackColor,fontSize: 14),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: ColorApp.primaryColor),
      useMaterial3: true,
    );
  }
}
