import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReSwitch extends StatefulWidget {
  const CuReSwitch({
    super.key,
    this.checked,
    this.onChanged,
    this.color,
    this.label,
    this.disabled,
    this.spaceBetween,
    this.alignment,
  });

  final bool? checked;
  final Function? onChanged;
  final Color? color;
  final String? label;
  final bool? disabled;
  final bool? spaceBetween;
  final Alignment? alignment;

  @override
  State<CuReSwitch> createState() => _CuReSwitchState();
}

class _CuReSwitchState extends State<CuReSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: widget.spaceBetween != null && widget.spaceBetween!
            ? MainAxisSize.max
            : MainAxisSize.min,
        mainAxisAlignment: widget.spaceBetween != null && widget.spaceBetween!
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.label != null &&
              (widget.spaceBetween != null && widget.spaceBetween!))
            CuReText(
              widget.label!,
              padding: const EdgeInsets.only(
                left: 4,
              ),
            ),
          if (CuReUtils.isIos()) _getIosSwitch(),
          if (!CuReUtils.isIos()) _getAndroidSwitch(),
          if (widget.label != null &&
              (widget.spaceBetween == null || !widget.spaceBetween!))
            CuReText(widget.label!)
        ]);
  }

  Widget _getIosSwitch() {
    return Transform.scale(
      scale: 0.7,
      alignment: widget.alignment ?? Alignment.centerRight,
      child: CupertinoSwitch(
        inactiveTrackColor:
            CuReDesign.useDarkMode ? const Color(0xff303030) : null,
        activeTrackColor: _getColor(),
        value: widget.checked ?? false,
        onChanged: widget.onChanged != null && _isToggable()
            ? (value) => widget.onChanged!(value)
            : null,
      ),
    );
  }

  Widget _getAndroidSwitch() {
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        trackColor: WidgetStateProperty.all(
          CuReDesign.useDarkMode ? const Color(0xff303030) : null,
        ),
        activeTrackColor: _getColor(),
        value: widget.checked ?? false,
        onChanged: widget.onChanged != null && _isToggable()
            ? (value) => widget.onChanged!(value)
            : null,
      ),
    );
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

  bool _isToggable() {
    return widget.disabled == null || !widget.disabled!;
  }
}
