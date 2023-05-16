import 'package:fancy_dio_inspector/src/models/models.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:fancy_dio_inspector/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FancyDioTile extends StatelessWidget {
  final String? title;
  final String description;
  final FancyDioInspectorTileOptions options;

  const FancyDioTile({
    required this.description,
    required this.options,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const FancyGap.verySmall(),
        ],
        if (options.maxCharacters == null)
          Text(description)
        else
          Text(
            description.getFirstXLetters(
              options.maxCharacters!,
              addThreeDots: true,
            ),
            maxLines: options.maxLines,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}
