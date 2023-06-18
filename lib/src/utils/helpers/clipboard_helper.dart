// ignore_for_file: cascade_invocations

import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/models/network/network.dart';
import 'package:flutter/services.dart';

mixin ClipboardHelper {
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  static String createClipboardText(NetworkBaseModel component) {
    final buffer = StringBuffer();

    buffer.writeln('${FancyStrings.urlTitle} (${component.method}):');
    buffer.writeln(component.url);
    buffer.writeln();

    if (component.method != 'GET') {
      buffer.writeln('${FancyStrings.requestTitle}:');
      buffer.writeln(component.requestBody);
      buffer.writeln();
    }

    if (component is NetworkResponseModel) {
      buffer.writeln(
        '${FancyStrings.responseTitle} (${component.statusCode}):',
      );
      buffer.writeln(component.responseBody);
      buffer.writeln();
    } else if (component is NetworkErrorModel) {
      buffer.writeln(
        '${FancyStrings.errorTitle} (${component.statusCode}):',
      );
      buffer.writeln('${component.errorBody} ');
      buffer.writeln();
    }

    buffer.writeln('${FancyStrings.headersTitle}:');
    buffer.writeln(component.headers.trim());
    buffer.writeln();

    buffer.write(component.time);

    return buffer.toString();
  }
}
