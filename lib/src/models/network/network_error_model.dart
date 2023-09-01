import 'package:fancy_dio_inspector/src/models/network/network_base_model.dart';

class NetworkErrorModel extends NetworkBaseModel {
  final String statusCode;
  final String errorBody;
  final Duration elapsedDuration;

  const NetworkErrorModel({
    required this.statusCode,
    required this.errorBody,
    required this.elapsedDuration,
    required super.url,
    required super.method,
    required super.requestBody,
    required super.headers,
    required super.cURL,
    required super.time,
  });

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
    final searchPattern = RegExp(query, caseSensitive: false);

    return searchPattern.hasMatch(url) ||
        searchPattern.hasMatch(method) ||
        searchPattern.hasMatch(requestBody) ||
        searchPattern.hasMatch(headers) ||
        searchPattern.hasMatch(statusCode) ||
        searchPattern.hasMatch(errorBody);
  }
}
