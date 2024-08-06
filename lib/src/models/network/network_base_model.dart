import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:fancy_dio_inspector/src/utils/helpers/clipboard_helper.dart';

/// This is the base model for all the network models.
sealed class NetworkBaseModel {
  /// The URL of the network request.
  final String url;

  /// The method of the network request.
  final String method;

  /// The body of the network request.
  final String requestBody;

  /// The headers of the network request.
  final String headers;

  /// The cURL code of the network request.
  final String cURL;

  /// The time of the network request.
  final DateTime time;

  const NetworkBaseModel({
    required this.url,
    required this.method,
    required this.requestBody,
    required this.headers,
    required this.cURL,
    required this.time,
  });

  NetworkBaseModel copyWith({
    String? url,
    String? method,
    String? requestBody,
    String? headers,
    String? cURL,
    DateTime? time,
  });

  RegExp getSearchPattern(String query) {
    return RegExp(RegExp.escape(query), caseSensitive: false);
  }

  /// This is needed in order to find the a specific network request, response
  /// or error in the list.
  bool contains(String query) {
    final searchPattern = getSearchPattern(query);

    return searchPattern.hasMatch(url) ||
        searchPattern.hasMatch(method) ||
        searchPattern.hasMatch(requestBody) ||
        searchPattern.hasMatch(headers);
  }

  /// This is needed in order to copy the network request, response or error.
  String toClipboardText() => ClipboardHelper.createClipboardText(this);
}

base class NetworkRequestModel extends NetworkBaseModel {
  const NetworkRequestModel({
    required super.url,
    required super.method,
    required super.requestBody,
    required super.headers,
    required super.cURL,
    required super.time,
  });

  @override
  NetworkRequestModel copyWith({
    String? url,
    String? method,
    String? requestBody,
    String? headers,
    String? cURL,
    DateTime? time,
  }) {
    return NetworkRequestModel(
      url: url ?? super.url,
      method: method ?? super.method,
      requestBody: requestBody ?? super.requestBody,
      headers: headers ?? super.headers,
      cURL: cURL ?? super.cURL,
      time: time ?? super.time,
    );
  }
}

base class NetworkResponseModel extends NetworkBaseModel {
  final String statusCode;
  final String responseBody;
  final Duration elapsedDuration;

  const NetworkResponseModel({
    required this.statusCode,
    required this.responseBody,
    required this.elapsedDuration,
    required super.url,
    required super.method,
    required super.requestBody,
    required super.headers,
    required super.cURL,
    required super.time,
  });

  @override
  NetworkResponseModel copyWith({
    String? statusCode,
    String? responseBody,
    Duration? elapsedDuration,
    String? url,
    String? method,
    String? requestBody,
    String? headers,
    String? cURL,
    DateTime? time,
  }) {
    return NetworkResponseModel(
      statusCode: statusCode ?? this.statusCode,
      responseBody: responseBody ?? this.responseBody,
      elapsedDuration: elapsedDuration ?? this.elapsedDuration,
      url: url ?? this.url,
      method: method ?? this.method,
      requestBody: requestBody ?? this.requestBody,
      headers: headers ?? this.headers,
      cURL: cURL ?? this.cURL,
      time: time ?? this.time,
    );
  }

  @override
  bool contains(String query) {
    final searchPattern = getSearchPattern(query);

    if (super.contains(query)) {
      return true;
    }

    return searchPattern.hasMatch(statusCode) ||
        searchPattern.hasMatch(responseBody);
  }

  String getFormattedTime() {
    return '${time.toFormattedString()} (${elapsedDuration.inMilliseconds} ms)';
  }
}

base class NetworkErrorModel extends NetworkBaseModel {
  final String statusCode;
  final String errorBody;

  const NetworkErrorModel({
    required this.statusCode,
    required this.errorBody,
    required super.url,
    required super.method,
    required super.requestBody,
    required super.headers,
    required super.cURL,
    required super.time,
  });

  @override
  NetworkErrorModel copyWith({
    String? statusCode,
    String? errorBody,
    Duration? elapsedDuration,
    String? url,
    String? method,
    String? requestBody,
    String? headers,
    String? cURL,
    DateTime? time,
  }) {
    return NetworkErrorModel(
      statusCode: statusCode ?? this.statusCode,
      errorBody: errorBody ?? this.errorBody,
      url: url ?? this.url,
      method: method ?? this.method,
      requestBody: requestBody ?? this.requestBody,
      headers: headers ?? this.headers,
      cURL: cURL ?? this.cURL,
      time: time ?? this.time,
    );
  }

  @override
  bool contains(String query) {
    final searchPattern = getSearchPattern(query);

    if (super.contains(query)) {
      return true;
    }

    return searchPattern.hasMatch(statusCode) ||
        searchPattern.hasMatch(errorBody);
  }

  String getFormattedTime() {
    return time.toFormattedString();
  }
}
