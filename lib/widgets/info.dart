import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReInfo extends StatelessWidget {
  const CuReInfo({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.color,
    this.type,
    this.shape,
    this.child,
    this.padding,
  });

  final String? title;
  final String? description;
  final IconData? icon;
  final Color? color;
  final CuReInfoType? type;
  final CuReShape? shape;
  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: CuReDesign.spacing * 2,
            vertical: CuReDesign.spacing * 1.5,
          ),
      decoration: BoxDecoration(
        color: CuReUtils.lighten(
          _getColor(),
          0.3,
        ),
        borderRadius: Utils.getBorderRadius(
          shape,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: CuReDesign.spacing * 2),
            child: Icon(
              _getIcon(),
              size: 32,
              color: _getColor(),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  CuReText(
                    title!,
                    weight: FontWeight.w600,
                    color: CuReDesign.textColor,
                  ),
                if (description != null)
                  CuReText(description!, color: CuReDesign.textColor),
                if (child != null) child!,
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon() {
    if (icon != null) {
      return icon!;
    }
    switch (type) {
      case CuReInfoType.success:
        return CuReIcons.checkCircle;
      case CuReInfoType.warning:
        return CuReIcons.warning;
      case CuReInfoType.error:
        return CuReIcons.error;
      case CuReInfoType.info:
      default:
        return CuReIcons.info;
    }
  }

  Color _getColor() {
    if (color != null) {
      return color!;
    }
    switch (type) {
      case CuReInfoType.success:
        return CuReDesign.successColor;
      case CuReInfoType.warning:
        return CuReDesign.warningColor;
      case CuReInfoType.error:
        return CuReDesign.dangerColor;
      case CuReInfoType.info:
      default:
        return CuReDesign.infoColor;
    }
  }
}
