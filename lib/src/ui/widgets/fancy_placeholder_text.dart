import 'package:fancy_dio_inspector/fancy_dio_inspector.dart';
import 'package:flutter/material.dart';

class FancyPlaceholder extends StatelessWidget {
  final String placeholderText;
  const FancyPlaceholder({
    required this.placeholderText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        placeholderText,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class FancyNoDataPlaceholder extends StatelessWidget {
  final FancyDioInspectorL10nOptions l10nOptions;

  const FancyNoDataPlaceholder({
    required this.l10nOptions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FancyPlaceholder(
      placeholderText: l10nOptions.noDataYetText,
    );
  }
}

class FancyNoSearchResultsPlaceholder extends StatelessWidget {
  final FancyDioInspectorL10nOptions l10nOptions;

  const FancyNoSearchResultsPlaceholder({
    required this.l10nOptions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FancyPlaceholder(
      placeholderText: l10nOptions.noSearchResultsText,
    );
  }
}
