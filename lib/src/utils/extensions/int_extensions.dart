extension IntExtensions on int {
  String asTwoDigits() => this >= 10 ? '$this' : '0$this';
}
