import 'dart:ui';

import 'package:curving_reality_library/enums/text.dart';
import 'package:flutter/material.dart';

class CuReGradient {
  final CuReGradientType? type;
  final List<Color> colors;
  final Alignment? begin;
  final Alignment? end;

  CuReGradient({
    this.type,
    required this.colors,
    this.begin,
    this.end,
  });
}
