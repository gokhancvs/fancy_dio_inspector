import 'package:fancy_dio_inspector/src/models/network/network_base_model.dart';

class NetworkResponseModel extends NetworkBaseModel {
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
    final searchPattern = RegExp(query, caseSensitive: false);

    return searchPattern.hasMatch(url) ||
        searchPattern.hasMatch(method) ||
        searchPattern.hasMatch(requestBody) ||
        searchPattern.hasMatch(headers) ||
        searchPattern.hasMatch(statusCode) ||
        searchPattern.hasMatch(responseBody);
  }
}
