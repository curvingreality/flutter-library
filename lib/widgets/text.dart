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
    this.fontStyle,
    this.gradient,
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
  final FontStyle? fontStyle;
  final CuReGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: gradient != null ? _getGradient() : _getText());
  }

  Text _getText() {
    return Text(
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
        fontStyle: fontStyle,
      ),
    );
  }

  Widget _getGradient() {
    switch (gradient!.type) {
      case CuReGradientType.radial:
        return ShaderMask(
          shaderCallback: (bounds) {
            return RadialGradient(
              colors: gradient!.colors,
              center: Alignment.center,
              radius: 0.5,
            ).createShader(bounds);
          },
          child: _getText(),
        );
      case CuReGradientType.sweep:
        return ShaderMask(
          shaderCallback: (bounds) {
            return SweepGradient(
              colors: gradient!.colors,
              center: Alignment.center,
            ).createShader(bounds);
          },
          child: _getText(),
        );
      default:
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: gradient!.colors,
              begin: gradient!.begin ?? Alignment.topLeft,
              end: gradient!.end ?? Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: _getText(),
        );
    }
  }

  Color _getColor() {
    if (gradient != null) {
      return Colors
          .white; // Placeholder color when gradient is used, as Text widget does not support gradients directly.
    }
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
