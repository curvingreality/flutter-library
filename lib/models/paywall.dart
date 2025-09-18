import 'package:flutter/cupertino.dart';

class CuRePaywallItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  CuRePaywallItem(
      {required this.title,
      required this.description,
      required this.icon,
      required this.color});
}

class CuRePaywallPrice {
  final int id;
  final String title;
  final double price;
  final String duration;
  final String? discount;

  CuRePaywallPrice(
      {required this.id,
      required this.title,
      required this.price,
      required this.duration,
      this.discount});
}
