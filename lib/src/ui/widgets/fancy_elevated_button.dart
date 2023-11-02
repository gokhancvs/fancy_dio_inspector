import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
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
    return ElevatedButton.icon(
      icon: prefix ?? const SizedBox.shrink(),
      onPressed: onPressed,
      label: Text(text),
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
