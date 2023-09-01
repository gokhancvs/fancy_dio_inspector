import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';

extension DateTimeExtensions on DateTime {
  String toFormattedString() {
    return '''$year.${month.asTwoDigits()}.${day.asTwoDigits()} ${hour.asTwoDigits()}:${minute.asTwoDigits()}:${second.asTwoDigits()}''';
  }
}
