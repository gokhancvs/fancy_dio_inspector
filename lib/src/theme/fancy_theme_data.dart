import 'package:fancy_dio_inspector/src/theme/fancy_colors.dart';
import 'package:flutter/material.dart';

mixin FancyThemeData {
  static final ThemeData light = ThemeData.light().copyWith(
    primaryColor: FancyColors.turquoise,
    indicatorColor: FancyColors.darkCyan,
    appBarTheme: const AppBarTheme(
      backgroundColor: FancyColors.turquoise,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: FancyColors.turquoise,
      elevation: 0,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: FancyColors.white,
      unselectedLabelColor: FancyColors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: FancyColors.turquoise,
    ),
    iconTheme: const IconThemeData(
      color: FancyColors.white,
    ),
  );

  static final ThemeData dark = light;
}
