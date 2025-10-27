import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/models/network/network.dart';
import 'package:flutter/services.dart';

mixin ClipboardHelper {
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  static String createClipboardText(NetworkBaseModel component) {
    final buffer = StringBuffer()
      ..writeln('${FancyStrings.urlTitle} (${component.method}):')
      ..writeln(component.url)
      ..writeln();

    if (component.method != 'GET') {
      buffer
        ..writeln('${FancyStrings.requestTitle}:')
        ..writeln(component.requestBody)
        ..writeln();
    }

    if (component is NetworkResponseModel) {
      buffer
        ..writeln('${FancyStrings.responseTitle} (${component.statusCode}):')
        ..writeln(component.responseBody)
        ..writeln();
    } else if (component is NetworkErrorModel) {
      buffer
        ..writeln('${FancyStrings.errorTitle} (${component.statusCode}):')
        ..writeln(component.errorBody)
        ..writeln();
    }

    buffer
      ..writeln('${FancyStrings.headersTitle}:')
      ..writeln(component.headers.trim())
      ..writeln();

    if (component is NetworkResponseModel) {
      buffer.write(component.getFormattedTime());
    } else if (component is NetworkErrorModel) {
      buffer.write(component.getFormattedTime());
    } else {
      buffer.write(component.time);
    }

    return buffer.toString();
  }
}
