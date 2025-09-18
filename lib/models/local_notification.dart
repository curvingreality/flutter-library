import 'package:curving_reality_library/enums/local_notification.dart';
import 'package:flutter/material.dart';

class LocalNotification {
  final int? id;
  final Color? color;
  final IconData? icon;
  final String? title;
  final String? description;
  final Widget? child;
  final Duration? duration;
  final Function? onTap;
  final LocalNotificationType? type;

  LocalNotification({
    this.id,
    this.color,
    this.icon,
    this.title,
    this.description,
    this.child,
    this.duration,
    this.onTap,
    this.type,
  });
}
