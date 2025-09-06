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
    final Widget widget;

    switch (T) {
      case NetworkResponseModel():
        final innerComponent = component as NetworkResponseModel;
        widget = FancyDioTile(
          title: '$responseTitleText (${innerComponent.statusCode})',
          description: innerComponent.responseBody,
          options: options,
        );

      case NetworkErrorModel():
        final innerComponent = component as NetworkErrorModel;
        widget = FancyDioTile(
          title: '$errorTitleText (${innerComponent.statusCode})',
          description: innerComponent.errorBody,
          options: options,
        );

      default:
        return const SizedBox.shrink();
    }

    return Column(children: [const FancyGap.medium(), widget]);
  }
}
