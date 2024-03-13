/// It is used to configure the `FancyDioInspectorView` widget.
class FancyDioInspectorTileOptions {
  /// It controls whether to show copy buttons or not.
  final bool showButtons;

  /// It controls the maximum number of characters to be shown in the tile.
  /// If the length of the string is greater than the `maxCharacters`, then
  /// the string will be truncated and `...` will be appended at the end.
  final int? maxCharacters;

  /// It controls the maximum number of lines to be shown in the tile.
  /// If the number of lines of the string is greater than the `maxLines`,
  /// then the string will be truncated and `...` will be appended at the end.
  final int? maxLines;

  /// It controls whether to show the search field to filter elements or not.
  final bool showSearch;

  const FancyDioInspectorTileOptions({
    this.showButtons = true,
    this.showSearch = true,
    this.maxCharacters,
    this.maxLines,
  });
}
