import 'package:curving_reality_library/enums/general.dart';
import 'package:flutter/material.dart';

import 'enums/animation.dart';

class CuReDesign {
  // Colors
  static Color primaryColor = const Color(0xffa3195b);
  static Color secondaryColor = Colors.blue;
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff181818);
  static Color disabledColor = const Color(0xffbdbdbd);
  static Color textColor = const Color(0xff222222);
  static Color dangerColor = const Color(0xffff5733);
  static Color successColor = const Color(0xff8bc34a);
  static Color warningColor = const Color(0xffff892e);
  static Color infoColor = const Color.fromARGB(255, 86, 135, 251);

  // Other
  static bool useDarkMode = false;
  static CuReShape defaultElementsShape = CuReShape.regular;
  static double borderRadius = 8.0;
  static double spacing = 8.0;

  // Animation durations
  static Map<CuReAnimationDuration, Duration> animationDurations = {
    CuReAnimationDuration.slow: const Duration(milliseconds: 600),
    CuReAnimationDuration.medium: const Duration(milliseconds: 400),
    CuReAnimationDuration.fast: const Duration(milliseconds: 200),
  };

  // Paddings
  static Map<String, EdgeInsets> paddings = {
    'small': const EdgeInsets.all(6.0),
    'medium': const EdgeInsets.all(10.0),
    'large': const EdgeInsets.all(12.0),
    'biggest': const EdgeInsets.all(16.0),
    'small-horizontal': const EdgeInsets.symmetric(horizontal: 6.0),
    'medium-horizontal': const EdgeInsets.symmetric(horizontal: 10.0),
    'large-horizontal': const EdgeInsets.symmetric(horizontal: 12.0),
    'biggest-horizontal': const EdgeInsets.symmetric(horizontal: 16.0),
    'small-vertical': const EdgeInsets.symmetric(vertical: 6.0),
    'medium-vertical': const EdgeInsets.symmetric(vertical: 10.0),
    'large-vertical': const EdgeInsets.symmetric(vertical: 12.0),
    'biggest-vertical': const EdgeInsets.symmetric(vertical: 16.0),
  };
}
