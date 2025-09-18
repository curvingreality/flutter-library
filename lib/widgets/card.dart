import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReCard extends StatelessWidget {
  const CuReCard({
    super.key,
    this.child,
    this.icon,
    this.title,
    this.description,
    this.color,
    this.onPressed,
    this.backgroundColor,
    this.padding,
    this.border,
    this.width,
    this.height,
    this.shape,
    this.shadow,
  });

  final Widget? child;
  final IconData? icon;
  final String? title;
  final String? description;
  final Color? color;
  final Color? backgroundColor;
  final Function? onPressed;
  final EdgeInsets? padding;
  final Border? border;
  final double? width;
  final double? height;
  final CuReShape? shape;
  final BoxShadow? shadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: Utils.getSplashFactory(),
      borderRadius: Utils.getBorderRadius(shape),
      onTap: onPressed != null ? () => onPressed!() : null,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            shadow ??
                BoxShadow(
                  color: CuReDesign.useDarkMode
                      ? Colors.black.withValues(alpha: 0.35)
                      : Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1),
                ),
          ],
        ),
        child: Material(
          borderRadius: Utils.getBorderRadius(shape),
          child: Ink(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: border,
              color: backgroundColor ??
                  (CuReDesign.useDarkMode
                      ? const Color(0xff181818)
                      : CuReDesign.whiteColor),
              borderRadius: Utils.getBorderRadius(
                shape,
              ),
            ),
            padding: padding ?? const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                        padding: EdgeInsets.only(bottom: CuReDesign.spacing),
                        child: Icon(
                          icon,
                          size: 40,
                          color: color ?? CuReDesign.primaryColor,
                        ),
                      )
                    : Container(),
                title != null
                    ? CuReText(
                        title!,
                        size: 20,
                        weight: FontWeight.w600,
                      )
                    : Container(),
                description != null
                    ? CuReText(
                        description!,
                        align: TextAlign.center,
                      )
                    : Container(),
                child != null ? child! : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
