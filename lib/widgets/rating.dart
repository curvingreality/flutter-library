import 'package:curving_reality_library/icons.dart';
import 'package:flutter/material.dart';

class CuReRating extends StatefulWidget {
  const CuReRating({
    super.key,
    this.max,
    this.icon,
    this.onTap,
    required this.rating,
    this.color,
    this.disabled,
    this.size,
  });

  final int? max;
  final IconData? icon;
  final Function(int)? onTap;
  final int rating;
  final Color? color;
  final bool? disabled;
  final double? size;

  @override
  State<CuReRating> createState() => _CuReRatingState();
}

class _CuReRatingState extends State<CuReRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.max ?? 5, (index) {
        return GestureDetector(
          onTap:
              widget.disabled == true ? null : () => widget.onTap!(index + 1),
          child: Icon(
            widget.icon ?? CuReIcons.star,
            color: _getColor(index),
            size: widget.size ?? 30,
          ),
        );
      }),
    );
  }

  Color _getColor(int index) {
    if (index < widget.rating) {
      return widget.color ?? Colors.yellow.shade600;
    }
    return Colors.grey.withAlpha(60);
  }
}
