import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReCircularProgressIndicator extends StatelessWidget {
  const CuReCircularProgressIndicator({super.key, this.color, this.size});

  final Color? color;
  final CuReProgressIndicatorSize? size;

  @override
  Widget build(BuildContext context) {
    if (CuReUtils.isIos()) {
      return CupertinoActivityIndicator(
        color: color ?? CuReDesign.primaryColor,
        radius: _getSize(),
      );
    } else {
      return Transform.scale(
        scale: _getSize(),
        child: CircularProgressIndicator(
          color: color ?? CuReDesign.primaryColor,
          strokeWidth: 2,
        ),
      );
    }
  }

  double _getSize() {
    double defautlSize;
    if (CuReUtils.isIos()) {
      defautlSize = 10;
    } else {
      defautlSize = 0.6;
    }
    switch (size) {
      case CuReProgressIndicatorSize.small:
        return defautlSize;
      case CuReProgressIndicatorSize.medium:
        return defautlSize + (CuReUtils.isIos() ? 3 : 0.3);
      case CuReProgressIndicatorSize.large:
        return defautlSize + (CuReUtils.isIos() ? 6 : 0.6);
      default:
        return defautlSize;
    }
  }
}
