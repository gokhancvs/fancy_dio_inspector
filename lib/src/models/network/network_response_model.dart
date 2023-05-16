import 'package:fancy_dio_inspector/src/models/network/network_base_model.dart';

class NetworkResponseModel extends NetworkBaseModel {
  final String statusCode;
  final String responseBody;

  const NetworkResponseModel({
    required this.statusCode,
    required this.responseBody,
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
