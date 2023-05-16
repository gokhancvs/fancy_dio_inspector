import 'package:dio/dio.dart';

extension HeadersExtensions on Headers {
  String createResponseHeaderComponent() {
    return toString();
  }
}
