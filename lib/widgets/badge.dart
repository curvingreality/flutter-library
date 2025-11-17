import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/cupertino.dart';

class CuReBadge extends StatelessWidget {
  const CuReBadge({
    super.key,
    this.label,
    this.icon,
    this.color,
    this.padding,
    this.shape,
    this.fontSize,
    this.child,
  });

  final String? label;
  final IconData? icon;
  final Color? color;
  final EdgeInsets? padding;
  final CuReShape? shape;
  final double? fontSize;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color != null
              ? CuReUtils.lighten(color!, 0.31)
              : CuReUtils.lighten(CuReDesign.primaryColor, 0.31),
          borderRadius: _getShape()),
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              vertical: _getVerticalPadding(),
              horizontal: label == null && icon != null ? 6 : 14,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (child != null) child!,
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(right: label != null ? 5 : 0),
                child: Icon(
                  icon,
                  size: _getIconSize(),
                  color:
                      CuReUtils.darken(color ?? CuReDesign.primaryColor, 0.2),
                ),
              ),
            if (label != null)
              CuReText(
                label!,
                color: CuReUtils.darken(color ?? CuReDesign.primaryColor, 0.2),
                lineHeight: 0,
                size: fontSize ?? 12,
                weight: FontWeight.w600,
              ),
          ],
        ),
      ),
    );
  }

  double _getVerticalPadding() {
    if (icon != null && label == null) {
      return 6;
    }
    if (icon != null && label != null) {
      return 8;
    }
    return 10;
  }

  double _getIconSize() {
    if (label == null) {
      return 22;
    }
    return 18;
  }

  BorderRadius _getShape() {
    CuReShape shapeSelected = CuReShape.rounded;
    if (shape != null) {
      shapeSelected = shape!;
    } else {
      shapeSelected = CuReShape.rounded;
    }
    return Utils.getBorderRadius(shapeSelected);
  }
}
