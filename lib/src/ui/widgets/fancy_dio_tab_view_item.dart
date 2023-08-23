import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FancyDioTabViewItem<T extends NetworkBaseModel> extends StatelessWidget {
  final T component;
  final FancyDioInspectorTileOptions tileOptions;
  final FancyDioInspectorL10nOptions l10nOptions;

  const FancyDioTabViewItem({
    required this.component,
    required this.tileOptions,
    required this.l10nOptions,
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
                  text: l10nOptions.cURLText,
                  onPressed: () {
                    context
                      ..showSnackBar(l10nOptions.cURLCopiedText)
                      ..copyToClipboard(component.cURL);
                  },
                ),
              ),
              const FancyGap.medium(),
              Expanded(
                child: FancyElevatedButton.copy(
                  text: l10nOptions.copyText,
                  onPressed: () {
                    context
                      ..showSnackBar(l10nOptions.copiedText)
                      ..copyToClipboard(component.toClipboardText());
                  },
                ),
              ),
            ],
          ),
          const FancyGap.medium(),
        ],
        FancyDioTile(
          title: '${l10nOptions.urlTitleText} (${component.method})',
          description: component.url,
          options: tileOptions,
        ),
        if (component.method != 'GET') ...[
          const FancyGap.medium(),
          FancyDioTile(
            title: l10nOptions.requestTitleText,
            description: component.requestBody,
            options: tileOptions,
          ),
        ],
        FancyResponseNetworkTile(
          component: component,
          options: tileOptions,
          responseTitleText: l10nOptions.responseTitleText,
          errorTitleText: l10nOptions.errorTitleText,
        ),
        const FancyGap.medium(),
        FancyDioTile(
          title: l10nOptions.headersTitleText,
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
