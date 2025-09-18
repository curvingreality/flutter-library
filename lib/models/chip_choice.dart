import 'package:flutter/widgets.dart';

class CuReChipChoiceItem {
  CuReChipChoiceItem({
    required this.value,
    this.label,
    this.icon,
    this.color,
    this.disabled,
    this.solid,
  });

  final dynamic value;
  final String? label;
  final IconData? icon;
  final Color? color;
  final bool? disabled;
  final bool? solid;
}
