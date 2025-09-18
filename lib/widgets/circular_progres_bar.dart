import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:flutter/material.dart';

class CuReCircularProgressBar extends StatelessWidget {
  const CuReCircularProgressBar({
    super.key,
    this.color,
    this.size,
    required this.percentage,
    this.showPercentage,
    this.child,
  });

  final Color? color;
  final double? size;
  final double percentage;
  final bool? showPercentage;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.square(
          dimension: size ?? 50,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: percentage / 100),
            duration:
                CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
            builder: (context, value, _) => CircularProgressIndicator(
              value: value,
              color: color ?? CuReDesign.primaryColor,
              backgroundColor: (color != null
                  ? color!.withAlpha(60)
                  : CuReDesign.primaryColor.withAlpha(60)),
              strokeWidth: size != null ? ((size! * 6) / 50) : 6,
              strokeCap: StrokeCap.round,
            ),
          ),
        ),
        if (showPercentage != null && showPercentage!)
          CuReText(
            '${percentage.toStringAsFixed(0)}%',
            weight: FontWeight.w600,
            size: size != null ? ((size! * 13) / 50) : 13,
            color: color ?? CuReDesign.primaryColor,
          ),
        if (child != null) child!,
      ],
    );
  }
}
