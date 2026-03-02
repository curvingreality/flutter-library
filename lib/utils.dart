import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/material.dart';

class Utils {
  static BorderRadius getBorderRadius(CuReShape? shape) {
    if (shape == CuReShape.squared) {
      return BorderRadius.circular(0);
    }
    if (shape == CuReShape.rounded) {
      return BorderRadius.circular(100);
    }
    if (shape == CuReShape.regular) {
      return BorderRadius.circular(8);
    }
    if (CuReDesign.defaultElementsShape == CuReShape.squared) {
      return BorderRadius.circular(0);
    }
    if (CuReDesign.defaultElementsShape == CuReShape.rounded) {
      return BorderRadius.circular(100);
    }
    return BorderRadius.circular(CuReDesign.borderRadius);
  }

  static double getBorderRadiusNumber(CuReShape? shape) {
    if (shape == CuReShape.squared ||
        CuReDesign.defaultElementsShape == CuReShape.squared) {
      return 0;
    }
    if (shape == CuReShape.rounded ||
        CuReDesign.defaultElementsShape == CuReShape.rounded) {
      return 100;
    }
    return CuReDesign.borderRadius;
  }

  static InteractiveInkFeatureFactory getSplashFactory() {
    return CuReUtils.isIos() ? NoSplash.splashFactory : InkRipple.splashFactory;
  }
}
