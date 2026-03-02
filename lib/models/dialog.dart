import 'package:flutter/material.dart';

class CuReDialogAction {
  final String label;
  final Function? onPressed;
  final Color? color;
  final IconData? icon;

  CuReDialogAction(
      {required this.label, this.onPressed, this.color, this.icon});
}
