import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReSelectableCard extends StatelessWidget {
  const CuReSelectableCard({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.child,
    this.selected,
    this.shape,
    this.onPressed,
    this.color,
  });

  final String? title;
  final String? description;
  final IconData? icon;
  final Widget? child;
  final bool? selected;
  final CuReShape? shape;
  final Function? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: CuReDesign.useDarkMode
                ? const Color(0xff181818)
                : Colors.grey[100],
            borderRadius: Utils.getBorderRadius(shape),
            border: Border.all(
              color: selected != null && selected!
                  ? color != null
                      ? color!.withAlpha(200)
                      : CuReDesign.primaryColor.withAlpha(200)
                  : CuReDesign.useDarkMode
                      ? const Color(0xff333333)
                      : Colors.grey[100]!,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(20),
          duration:
              CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: color != null
                        ? color!.withAlpha(20)
                        : CuReDesign.primaryColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    icon,
                    size: 30,
                    color: color ?? CuReDesign.primaryColor.withAlpha(200),
                  ),
                ),
              ),
            if (title != null || description != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    CuReText(
                      title!,
                      weight: FontWeight.w600,
                      size: 15,
                    ),
                  if (description != null)
                    CuReText(
                      description!,
                      size: 14,
                    ),
                ],
              ),
            if (child != null) child!
          ]),
        ));
  }
}
