import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/material.dart';

class CuReText extends StatelessWidget {
  const CuReText(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.lineHeight,
    this.maxLines,
    this.align,
    this.decoration,
    this.overflow,
    this.shadows,
    this.padding,
    this.letterSpacing,
    this.fontFamily,
  });

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final double? lineHeight;
  final int? maxLines;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final List<Shadow>? shadows;
  final EdgeInsets? padding;
  final double? letterSpacing;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: align ?? TextAlign.start,
        overflow: overflow,
        style: TextStyle(
          fontSize: size ?? 16,
          color: _getColor(),
          fontWeight: weight ?? FontWeight.normal,
          height: lineHeight ?? 1.5,
          decoration: decoration ?? TextDecoration.none,
          shadows: shadows,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
        ),
      ),
    );
  }

  Color _getColor() {
    if (color != null) {
      return color!;
    }
    if (CuReDesign.useDarkMode) {
      return CuReDesign.whiteColor;
    } else {
      return CuReDesign.textColor;
    }
  }
}
