import 'package:fancy_dio_inspector/src/theme/theme.dart';
import 'package:flutter/material.dart';

mixin FancyThemeData {
  static final ThemeData light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: FancyColors.turquoise),
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
    tabBarTheme: const TabBarThemeData(
      labelColor: FancyColors.white,
      unselectedLabelColor: FancyColors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: FancyColors.turquoise,
      selectionColor: FancyColors.turquoise,
      selectionHandleColor: FancyColors.darkCyan,
    ),
    iconTheme: const IconThemeData(
      color: FancyColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: FancyColors.darkCyan,
        padding: const EdgeInsets.all(16),
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: FancyColors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: FancyColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: FancyColors.grey),
      ),
      prefixIconColor: FancyColors.grey,
      suffixIconColor: FancyColors.grey,
    ),
  );

  static final ThemeData dark = light;
}
