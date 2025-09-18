import 'package:flutter/material.dart';

class CuReSettingsItem {
  final IconData? icon;
  final Widget? iconChild;
  final String description;
  final Widget child;
  final Color? color;

  CuReSettingsItem({
    this.icon,
    this.iconChild,
    required this.description,
    required this.child,
    this.color,
  });
}
