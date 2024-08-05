import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/utils/enums/enums.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:flutter/foundation.dart';

/// A fancy logger that logs network requests, responses and errors.
final class FancyDioLogger {
  FancyDioLogger._();
  static final FancyDioLogger instance = FancyDioLogger._();

  FancyDioInspectorOptions options = const FancyDioInspectorOptions();
  FancyDioInspectorConsoleOptions get consoleOptions => options.consoleOptions;

  List<NetworkRequestModel> _apiRequests = [];
  List<NetworkResponseModel> _apiResponses = [];
  List<NetworkErrorModel> _apiErrors = [];

  List<NetworkRequestModel> get apiRequests => [..._apiRequests];
  List<NetworkResponseModel> get apiResponses => [..._apiResponses];
  List<NetworkErrorModel> get apiErrors => [..._apiErrors];

  /// [T] must be either [RequestOptions], [Response] or [DioException].
  void log<T>(T data) {
    final now = DateTime.now();

    if (data is RequestOptions) {
      data.extra[FancyDioKey.requestTime.key] = now;

      final requestModel = NetworkRequestModel(
        url: data.createUrlComponent(),
        method: data.createMethodComponent(),
        requestBody: data.createRequestBody(),
        headers: data.createRequestHeadersComponent(),
        cURL: data.cURL,
        time: now,
      );

      _apiRequests.insert(0, requestModel);

      if (consoleOptions.verbose) {
        consoleLog(model: requestModel);
      }

      _apiRequests = _apiRequests.take(options.maxLogs).toList();
    } else if (data is Response) {
      final responseModel = NetworkResponseModel(
        url: data.createUrlComponent(),
        method: data.createMethodComponent(),
        requestBody: data.createRequestComponent(),
        headers: data.createResponseHeadersComponent(),
        cURL: data.cURL,
        statusCode: data.createStatusCodeComponent(),
        responseBody: data.createResponseComponent(),
        time: now,
        elapsedDuration: data.calculateElapsedDuration(),
      );

      _apiResponses.insert(0, responseModel);

      if (consoleOptions.verbose) {
        consoleLog(model: responseModel);
      }

      _apiResponses = _apiResponses.take(options.maxLogs).toList();
    } else if (data is DioException) {
      final errorModel = NetworkErrorModel(
        url: data.createUrlComponent(),
        method: data.createMethodComponent(),
        requestBody: data.createRequestComponent(),
        headers: data.createResponseHeadersComponent(),
        cURL: data.cURL,
        statusCode: data.createStatusCodeComponent(),
        errorBody: data.createErrorComponent(),
        time: now,
      );

      _apiErrors.insert(0, errorModel);

      if (consoleOptions.verbose) {
        consoleLog(model: errorModel);
      }

      _apiErrors = _apiErrors.take(options.maxLogs).toList();
    } else {
      throw Exception('Invalid type!');
    }
  }

  void consoleLog({
    required NetworkBaseModel model,
  }) {
    late final String name;
    late FancyConsoleTextColors ansiiColor;
    const resetAnsiColor = FancyConsoleTextColors.reset;

    switch (model.runtimeType) {
      case NetworkRequestModel:
        name = consoleOptions.requestName;
        ansiiColor = consoleOptions.requestColor;
      case NetworkResponseModel:
        name = consoleOptions.responseName;
        ansiiColor = consoleOptions.responseColor;
      case NetworkErrorModel:
        name = consoleOptions.errorName;
        ansiiColor = consoleOptions.errorColor;
      default:
        throw Exception('Invalid type! ${model.runtimeType}}');
    }

    /// If [consoleOptions.colorize] is [false], we should reset the color.
    if (!consoleOptions.colorize) {
      ansiiColor = FancyConsoleTextColors.reset;
    }

    final data = model.toClipboardText();

    /// [log] function inside `dart:developer` truncates the output for some
    /// reason, so we use [debugPrint] instead as a workaround.
    if (kIsWeb) {
      final color = ansiiColor.value;

      debugPrint(
        '$color$data'.replaceAll('\n', '\n$color'),
      );
    } else {
      developer.log(
        '${ansiiColor.value}$data${resetAnsiColor.value}',
        name: name,
      );
    }
  }
}
