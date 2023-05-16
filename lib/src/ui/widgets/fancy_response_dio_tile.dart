import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FancyResponseNetworkTile<T extends NetworkBaseModel>
    extends StatelessWidget {
  final T component;
  final FancyDioInspectorTileOptions options;

  const FancyResponseNetworkTile({
    required this.component,
    required this.options,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget widget;

    switch (T) {
      case NetworkResponseModel:
        final innerComponent = component as NetworkResponseModel;
        widget = FancyDioTile(
          title: '${FancyStrings.responseTitle} (${innerComponent.statusCode})',
          description: innerComponent.responseBody,
          options: options,
        );
        break;
      case NetworkErrorModel:
        final innerComponent = component as NetworkErrorModel;
        widget = FancyDioTile(
          title: '${FancyStrings.errorTitle} (${innerComponent.statusCode})',
          description: innerComponent.errorBody,
          options: options,
        );
        break;

      default:
        return const SizedBox.shrink();
    }

    return Column(children: [const FancyGap.medium(), widget]);
  }
}
