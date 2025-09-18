import 'package:curving_reality_library/models/local_notification.dart';
import 'package:curving_reality_library/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class CuReNotifications {
  static GlobalKey<CuReScaffoldState> key = GlobalKey<CuReScaffoldState>();

  static void show(LocalNotification notification) {
    key.currentState?.enqueue(notification);
  }

  static void generateKey() {
    key = GlobalKey<CuReScaffoldState>();
  }
}

class QueuedNotification {
  final LocalNotification notification;
  QueuedNotification(this.notification);
}
