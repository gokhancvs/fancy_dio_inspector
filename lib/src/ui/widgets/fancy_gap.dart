import 'package:flutter/material.dart';

class FancyGap extends StatelessWidget {
  final double size;

  const FancyGap(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: size);
  }

  const factory FancyGap.medium() = _FancyMediumGap;

  const factory FancyGap.small() = _FancySmallGap;

  const factory FancyGap.verySmall() = _FancyVerySmallGap;
}

class _FancyMediumGap extends FancyGap {
  const _FancyMediumGap() : super(16);
}

class _FancySmallGap extends FancyGap {
  const _FancySmallGap() : super(8);
}

class _FancyVerySmallGap extends FancyGap {
  const _FancyVerySmallGap() : super(4);
}
