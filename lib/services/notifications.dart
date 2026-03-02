import 'package:curving_reality_library/models/local_notification.dart';
import 'package:curving_reality_library/widgets/scaffold.dart';
import 'package:flutter/material.dart';

class CuReNotifications {
  static GlobalKey<CuReScaffoldState> key = GlobalKey<CuReScaffoldState>();
  static Map<String, GlobalKey<CuReScaffoldState>> keys = {};

  static void show(LocalNotification notification) {
    if (notification.scaffoldKey != null) {
      notification.scaffoldKey?.currentState?.enqueue(notification);
      return;
    }
    key.currentState?.enqueue(notification);
  }

  static void generateKey() {
    key = GlobalKey<CuReScaffoldState>();
  }

  static GlobalKey<CuReScaffoldState> getRandomKey() {
    return GlobalKey<CuReScaffoldState>();
  }
}

class QueuedNotification {
  final LocalNotification notification;
  QueuedNotification(this.notification);
}
