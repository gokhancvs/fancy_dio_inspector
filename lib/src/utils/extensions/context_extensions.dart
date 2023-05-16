import 'package:fancy_dio_inspector/src/theme/theme.dart';
import 'package:fancy_dio_inspector/src/utils/helpers/clipboard_helper.dart';
import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  Brightness get brightness => theme.brightness;

  bool get isLightMode => brightness == Brightness.light;

  bool get isDarkMode => brightness == Brightness.dark;

  ThemeData get currentTheme {
    switch (brightness) {
      case Brightness.light:
        return FancyThemeData.light;
      case Brightness.dark:
        return FancyThemeData.dark;
    }
  }
}

extension ClipboardExtensions on BuildContext {
  void copyToClipboard(String text) {
    ClipboardHelper.copyToClipboard(text);
  }
}

extension SnackBarExtensions on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}
