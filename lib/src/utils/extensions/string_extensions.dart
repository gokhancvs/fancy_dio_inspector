extension StringExtensions on String {
  /// Returns the first [number] of characters of the string.
  /// If the length of the string is greater than the [number], then the string
  /// will be truncated and `...` will be appended at the end.
  String getFirstXLetters(int number, {bool addThreeDots = false}) {
    assert(number >= 0, 'Number must be greater than or equal to 0');

    return '''${substring(0, length < number ? length : number)}${length > number && addThreeDots ? '...' : ''}''';
  }
}
