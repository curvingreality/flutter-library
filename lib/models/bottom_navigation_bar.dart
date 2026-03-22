import 'package:flutter/material.dart';

class CuReBottomNavigationBarItem {
  final IconData? icon;
  final IconData? activeIcon;
  final String? label;
  final Widget? widgetIcon;
  final Widget? activeWidgetIcon;
  final String? tooltip;
  final Color? color;

  CuReBottomNavigationBarItem({
    this.icon,
    this.activeIcon,
    this.label,
    this.widgetIcon,
    this.activeWidgetIcon,
    this.tooltip,
    this.color,
  });
}
