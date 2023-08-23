import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/theme/theme.dart';
import 'package:fancy_dio_inspector/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FancyElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Widget? prefix;
  final TextStyle? textStyle;

  const FancyElevatedButton({
    required this.text,
    this.onPressed,
    this.prefix,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: FancyColors.darkCyan,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) ...[
              prefix!,
              const FancyGap.small(),
            ],
            Text(
              text,
              style: textStyle ?? const TextStyle(color: FancyColors.white),
            ),
          ],
        ),
      ),
    );
  }

  factory FancyElevatedButton.copy({
    String text = FancyStrings.copy,
    void Function()? onPressed,
  }) {
    return FancyElevatedButton(
      text: text,
      onPressed: onPressed,
      prefix: const Icon(Icons.copy),
    );
  }

  factory FancyElevatedButton.cURL({
    String text = FancyStrings.cURL,
    void Function()? onPressed,
  }) {
    return FancyElevatedButton(
      text: text,
      onPressed: onPressed,
      prefix: const Icon(Icons.copy),
    );
  }
}
