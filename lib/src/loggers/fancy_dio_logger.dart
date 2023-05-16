import 'package:dio/dio.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';

/// A fancy logger that logs network requests, responses and errors.
class FancyDioLogger {
  FancyDioLogger._();
  static final FancyDioLogger instance = FancyDioLogger._();

  FancyDioInspectorOptions options = const FancyDioInspectorOptions();

  List<NetworkRequestModel> _apiRequests = [];
  List<NetworkResponseModel> _apiResponses = [];
  List<NetworkErrorModel> _apiErrors = [];

  List<NetworkRequestModel> get apiRequests => [..._apiRequests];
  List<NetworkResponseModel> get apiResponses => [..._apiResponses];
  List<NetworkErrorModel> get apiErrors => [..._apiErrors];

  /// [T] must be either [RequestOptions], [Response] or [DioError].
  void log<T>(T data) {
    final now = DateTime.now();

    if (data is RequestOptions) {
      _apiRequests.insert(
        0,
        NetworkRequestModel(
          url: data.createUrlComponent(),
          method: data.createMethodComponent(),
          requestBody: data.createRequestBody(),
          headers: data.createRequestHeadersComponent(),
          cURL: data.cURL,
          time: now,
        ),
      );

      _apiRequests = _apiRequests.take(options.maxLogs).toList();
    } else if (data is Response) {
      _apiResponses.insert(
        0,
        NetworkResponseModel(
          url: data.createUrlComponent(),
          method: data.createMethodComponent(),
          requestBody: data.createRequestComponent(),
          headers: data.createResponseHeadersComponent(),
          cURL: data.cURL,
          statusCode: data.createStatusCodeComponent(),
          responseBody: data.createResponseComponent(),
          time: now,
        ),
      );

      _apiResponses = _apiResponses.take(options.maxLogs).toList();
    } else if (data is DioError) {
      _apiErrors.insert(
        0,
        NetworkErrorModel(
          url: data.createUrlComponent(),
          method: data.createMethodComponent(),
          requestBody: data.createRequestComponent(),
          headers: data.createResponseHeadersComponent(),
          cURL: data.cURL,
          statusCode: data.createStatusCodeComponent(),
          errorBody: data.createErrorComponent(),
          time: now,
        ),
      );

      _apiErrors = _apiErrors.take(options.maxLogs).toList();
    } else {
      throw Exception('Invalid type!');
    }
  }
}
