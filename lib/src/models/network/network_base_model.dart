import 'package:fancy_dio_inspector/src/utils/helpers/clipboard_helper.dart';

/// This is the base model for all the network models.
abstract class NetworkBaseModel {
  /// The URL of the network request.
  final String url;

  /// The method of the network request.
  final String method;

  /// The body of the network request.
  final String requestBody;

  /// The headers of the network request.
  final String headers;

  /// The cURL code of the network request.
  final String cURL;

  /// The time of the network request.
  final DateTime time;

  const NetworkBaseModel({
    required this.url,
    required this.method,
    required this.requestBody,
    required this.headers,
    required this.cURL,
    required this.time,
  });

  /// This is needed in order to find the a specific network request, response
  /// or error in the list.
  bool contains(String query);

  /// This is needed in order to copy the network request, response or error.
  String toClipboardText() => ClipboardHelper.createClipboardText(this);
}
