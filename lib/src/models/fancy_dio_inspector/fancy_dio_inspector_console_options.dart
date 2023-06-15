import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/utils/enums/enums.dart';

class FancyDioInspectorConsoleOptions {
  /// It controls whether to log to the console or not.
  final bool verbose;

  /// It controls whether to colorize the console or not if [verbose] is `true`.
  /// If [verbose] is `false`, this option is ignored.
  final bool colorize;

  /// It is the name of the request displayed in the console.
  final String requestName;

  /// It is the name of the response displayed in the console.
  final String responseName;

  /// It is the name of the error displayed in the console.
  final String errorName;

  /// It is the color of the request displayed in the console. [colorize] must
  /// be `true`. If [colorize] is `false`, this option is ignored.
  final FancyConsoleTextColors requestColor;

  /// It is the color of the response displayed in the console. [colorize] must
  /// be `true`. If [colorize] is `false`, this option is ignored.
  final FancyConsoleTextColors responseColor;

  /// It is the color of the error displayed in the console. [colorize] must
  /// be `true`. If [colorize] is `false`, this option is ignored.
  final FancyConsoleTextColors errorColor;

  const FancyDioInspectorConsoleOptions({
    this.verbose = false,
    this.colorize = true,
    this.requestName = FancyStrings.requestUpperCased,
    this.responseName = FancyStrings.responseUpperCased,
    this.errorName = FancyStrings.errorUpperCased,
    this.requestColor = FancyConsoleTextColors.yellow,
    this.responseColor = FancyConsoleTextColors.green,
    this.errorColor = FancyConsoleTextColors.red,
  });
}
