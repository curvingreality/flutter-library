import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/material.dart';

class CuReDivider extends StatelessWidget {
  const CuReDivider({
    super.key,
    this.height,
    this.color,
    this.padding,
    this.width,
    this.label,
    this.asBadge,
  });

  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final String? label;
  final bool? asBadge;

  @override
  Widget build(BuildContext context) {
    const double space = 20;

    if (label == null) {
      return Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: height ?? 1,
          width: width ?? double.infinity,
          color: _getColor(),
        ),
      );
    }

    if (asBadge != null && asBadge!) {
      return SizedBox(
          width: width ?? double.infinity,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: height ?? 1,
                    color: _getColor(),
                  ),
                ),
                const SizedBox(
                  width: space,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color ?? CuReUtils.lighten(CuReDesign.primaryColor),
                    borderRadius: BorderRadius.circular(
                      CuReDesign.borderRadius,
                    ),
                  ),
                  child: Text(
                    label!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  width: space,
                ),
                Expanded(
                  child: Container(
                    height: height ?? 1,
                    color: _getColor(),
                  ),
                ),
              ],
            ),
          ));
    }

    return Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          width: width ?? double.infinity,
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Container(
                    height: height ?? 1,
                    color: _getColor(),
                  ),
                ),
                const SizedBox(
                  width: space,
                ),
                Text(
                  label!,
                  style: TextStyle(
                    color: _getColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: space,
                ),
                Expanded(
                  child: Container(
                    height: height ?? 1,
                    color: _getColor(),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }

  Color _getColor() {
    if (color != null) {
      return color!;
    }
    if (CuReDesign.useDarkMode) {
      return Colors.grey.shade800;
    }
    return Colors.grey.shade400;
  }
}
