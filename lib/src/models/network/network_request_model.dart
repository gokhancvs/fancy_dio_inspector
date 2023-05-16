import 'package:fancy_dio_inspector/src/models/network/network_base_model.dart';

class NetworkRequestModel extends NetworkBaseModel {
  const NetworkRequestModel({
    required super.url,
    required super.method,
    required super.requestBody,
    required super.headers,
    required super.cURL,
    required super.time,
  });

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

  @override
  bool contains(String query) {
    final searchPattern = RegExp(query, caseSensitive: false);

    return searchPattern.hasMatch(url) ||
        searchPattern.hasMatch(method) ||
        searchPattern.hasMatch(requestBody) ||
        searchPattern.hasMatch(headers);
  }
}
