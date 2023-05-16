import 'package:dio/dio.dart';
import 'package:fancy_dio_inspector/src/loggers/fancy_dio_logger.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';

class FancyDioInterceptor extends Interceptor {
  FancyDioLogger get logger => FancyDioLogger.instance;

  final FancyDioInspectorOptions options;

  FancyDioInterceptor([this.options = const FancyDioInspectorOptions()]) {
    logger.options = options;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.log(options);

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger.log(response);

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.log(err);

    handler.next(err);
  }
}
