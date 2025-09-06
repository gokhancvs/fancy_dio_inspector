import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';

extension RequestExtensions on RequestOptions {
  String createUrlComponent() {
    return uri.toString();
  }

  String createMethodComponent() {
    return method;
  }

  String createRequestBody() {
    final String body;

    if (data is Map<String, dynamic>) {
      body = (data as Map<String, dynamic>).toPrettyJson();
    } else {
      body = data.toString();
    }

    return body;
  }

  String createRequestHeadersComponent() {
    return headers.toPrettyJson();
  }
}

extension CurlExtension on RequestOptions {
  String get cURL {
    var cmd = 'curl';

    final header = headers
        .map((key, value) {
          if (key == 'content-type' &&
              value.toString().contains('multipart/form-data')) {
            value = 'multipart/form-data;';
          }
          return MapEntry(key, "-H '$key: $value'");
        })
        .values
        .join(' ');
    var url = '$baseUrl$path';
    if (queryParameters.isNotEmpty) {
      final query = queryParameters
          .map((key, value) {
            return MapEntry(key, '$key=$value');
          })
          .values
          .join('&');

      url += (url.contains('?')) ? query : '?$query';
    }
    if (method == 'GET') {
      cmd += " $header '$url'";
    } else {
      final files = <String, dynamic>{};
      var postData = "-d ''";
      if (data != null) {
        if (data is FormData) {
          final fdata = data as FormData;
          for (final element in fdata.files) {
            final file = element.value;
            files[element.key] = '@${file.filename}';
          }
          for (final element in fdata.fields) {
            files[element.key] = element.value;
          }
          if (files.isNotEmpty) {
            postData = files
                .map((key, value) => MapEntry(key, "-F '$key=$value'"))
                .values
                .join(' ');
          }
        } else if (data is Map<String, dynamic>) {
          files.addAll(data as Map<String, dynamic>);

          if (files.isNotEmpty) {
            if (headers.containsValue(Headers.formUrlEncodedContentType)) {
              final encodeData = files.entries.map((entry) {
                final key = Uri.encodeQueryComponent(entry.key);
                final value = Uri.encodeQueryComponent(entry.value.toString());

                return '$key=$value';
              }).join('&');

              postData = "-d '$encodeData'";
            } else {
              postData = "-d '${json.encode(files)}'";
            }
          }
        }
      }

      cmd += " -X $method $postData $header '$url'";
    }

    return cmd;
  }
}
