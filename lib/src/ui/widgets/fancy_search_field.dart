import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
import 'package:fancy_dio_inspector/src/theme/theme.dart';
import 'package:flutter/material.dart';

class FancySearchField extends StatefulWidget {
  final String hintText;
  final void Function(String newValue) onChanged;

  const FancySearchField({
    required this.onChanged,
    this.hintText = FancyStrings.search,
    super.key,
  });

  @override
  State<FancySearchField> createState() => _FancySearchFieldState();
}

class _FancySearchFieldState extends State<FancySearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  void _onClearPressed() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    const defaultBorderSide = BorderSide(color: FancyColors.grey);

    const iconColor = FancyColors.grey;

    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: defaultBorderSide,
    );

    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIconColor: iconColor,
        suffixIconColor: iconColor,
        hintText: widget.hintText,
        border: defaultBorder,
        enabledBorder: defaultBorder,
        focusedBorder: defaultBorder,
        prefixIcon: const Icon(Icons.search, color: iconColor),
        suffixIcon: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _onClearPressed,
          child: const Icon(Icons.close, color: iconColor),
        ),
      ),
    );
  }
}
