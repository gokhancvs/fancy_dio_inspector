import 'package:dio/dio.dart';

typedef OnRequestCreated = void Function(RequestOptions options);
typedef OnResponseCreated = void Function(Response<dynamic> response);
typedef OnErrorCreated = void Function(DioException err);
