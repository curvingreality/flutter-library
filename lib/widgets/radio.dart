// ignore_for_file: deprecated_member_use

import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReRadio extends StatefulWidget {
  const CuReRadio({
    super.key,
    required this.value,
    required this.onChanged,
    this.color,
    this.label,
    required this.groupValue,
    this.disabled,
  });

  final dynamic value;
  final dynamic groupValue;
  final Function onChanged;
  final Color? color;
  final String? label;
  final bool? disabled;

  @override
  State<CuReRadio> createState() => _CuReRadioState();
}

class _CuReRadioState extends State<CuReRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (CuReUtils.isIos()) _getIosCheckbox(),
        if (!CuReUtils.isIos()) _getAndroidCheckbox(),
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CuReText(widget.label!),
          )
      ],
    );
  }

  Widget _getIosCheckbox() {
    return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 20, height: 20),
        child: CupertinoRadio<dynamic>(
          value: widget.value,
          activeColor: _getColor(),
          groupValue: widget.groupValue,
          onChanged: _isToggable() ? (value) => widget.onChanged(value) : null,
        ));
  }

  Widget _getAndroidCheckbox() {
    return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 20, height: 20),
        child: Radio<dynamic>(
          value: widget.value,
          activeColor: _getColor(),
          groupValue: widget.groupValue,
          onChanged: _isToggable() ? (value) => widget.onChanged(value) : null,
        ));
  }

  bool _isToggable() {
    return widget.disabled == null || !widget.disabled!;
  }

  Color _getColor() {
    if (widget.disabled != null && widget.disabled!) {
      return CuReDesign.disabledColor;
    } else if (widget.color != null) {
      return widget.color!;
    } else {
      return CuReDesign.primaryColor;
    }
  }
}
