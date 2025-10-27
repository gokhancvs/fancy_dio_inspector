import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FancyResponseNetworkTile<T extends NetworkBaseModel>
    extends StatelessWidget {
  final T component;
  final FancyDioInspectorTileOptions options;
  final String responseTitleText;
  final String errorTitleText;

  const FancyResponseNetworkTile({
    required this.component,
    required this.options,
    required this.responseTitleText,
    required this.errorTitleText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widget = switch (component) {
      NetworkResponseModel(:final statusCode, :final responseBody) =>
        FancyDioTile(
          title: '$responseTitleText ($statusCode)',
          description: responseBody,
          options: options,
        ),
      NetworkErrorModel(:final statusCode, :final errorBody) => FancyDioTile(
          title: '$errorTitleText ($statusCode)',
          description: errorBody,
          options: options,
        ),
      _ => const SizedBox.shrink(),
    };

    return Column(children: [const FancyGap.medium(), widget]);
  }
}
