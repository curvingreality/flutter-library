import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/material.dart';

class CuReEmptyState extends StatelessWidget {
  const CuReEmptyState(
      {super.key,
      this.child,
      this.title,
      this.description,
      this.iconChild,
      this.padding,
      this.icon});

  final IconData? icon;
  final Widget? iconChild;
  final Widget? child;
  final String? title;
  final String? description;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconChild ??
                Icon(
                  icon ?? CuReIcons.closeCircle,
                  size: 52,
                  color: CuReDesign.primaryColor,
                ),
            CuReSpacing.vertical(0.6),
            CuReText(
              title ?? Localization.getValue('empty_state_title'),
              size: 19,
              weight: FontWeight.w600,
            ),
            CuReSpacing.vertical(0.1),
            CuReText(
              description ?? Localization.getValue('empty_state_description'),
              align: TextAlign.center,
            ),
            if (child != null) ...[
              CuReSpacing.vertical(),
              child!,
            ]
          ],
        ),
      ),
    );
  }
}
