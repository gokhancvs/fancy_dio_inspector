import 'package:fancy_dio_inspector/src/l10n/l10n.dart';
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

  String get searchText => _controller.text.trim();

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
    return TextField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: KeyedSubtree(
            key: ValueKey(searchText.isEmpty),
            child: searchText.isEmpty
                ? const SizedBox.shrink()
                : GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: _onClearPressed,
                    child: const Icon(Icons.close),
                  ),
          ),
        ),
      ),
    );
  }
}
