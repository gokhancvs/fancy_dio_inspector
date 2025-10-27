import 'package:dio/dio.dart';
import 'package:fancy_dio_inspector/src/loggers/fancy_dio_logger.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/typedefs/typedefs.dart';

base class FancyDioInterceptor extends Interceptor {
  FancyDioLogger get logger => FancyDioLogger.instance;

  final FancyDioInspectorOptions options;

  final OnRequestCreated? onRequestCreated;
  final OnResponseCreated? onResponseCreated;
  final OnErrorCreated? onErrorCreated;

  FancyDioInterceptor({
    this.options = const FancyDioInspectorOptions(),
    this.onRequestCreated,
    this.onResponseCreated,
    this.onErrorCreated,
  }) {
    logger.options = options;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (this.options.logRequests) {
      logger.log(options);
      onRequestCreated?.call(options);
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (options.logResponses) {
      logger.log(response);
      onResponseCreated?.call(response);
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (options.logErrors) {
      logger.log(err);
      onErrorCreated?.call(err);
    }

    handler.next(err);
  }
}
