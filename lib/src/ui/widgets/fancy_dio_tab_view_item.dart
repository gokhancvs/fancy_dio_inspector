import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FancyDioTabViewItem<T extends NetworkBaseModel> extends StatelessWidget {
  final FancyDioInspectorTileOptions tileOptions;
  final T component;

  const FancyDioTabViewItem({
    required this.component,
    required this.tileOptions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (tileOptions.showButtons) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: FancyElevatedButton.cURL(
                  onPressed: () {
                    context
                      ..showSnackBar(FancyStrings.cURLCopied)
                      ..copyToClipboard(component.cURL);
                  },
                ),
              ),
              const FancyGap.medium(),
              Expanded(
                child: FancyElevatedButton.copy(
                  onPressed: () {
                    context
                      ..showSnackBar(FancyStrings.copied)
                      ..copyToClipboard(component.toClipboardText());
                  },
                ),
              ),
            ],
          ),
          const FancyGap.medium(),
        ],
        FancyDioTile(
          title: '${FancyStrings.urlTitle} (${component.method})',
          description: component.url,
          options: tileOptions,
        ),
        if (component.method != 'GET') ...[
          const FancyGap.medium(),
          FancyDioTile(
            title: FancyStrings.requestTitle,
            description: component.requestBody,
            options: tileOptions,
          ),
        ],
        FancyResponseNetworkTile(component: component, options: tileOptions),
        const FancyGap.medium(),
        FancyDioTile(
          title: FancyStrings.headersTitle,
          description: component.headers,
          options: tileOptions,
        ),
        const FancyGap.medium(),
        FancyDioTile(
          description: component.time.toString(),
          options: tileOptions,
        ),
      ],
    );
  }
}
