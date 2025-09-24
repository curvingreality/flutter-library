import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
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
    this.size,
    this.icon,
  });

  final dynamic value;
  final dynamic groupValue;
  final Function onChanged;
  final Color? color;
  final String? label;
  final bool? disabled;
  final double? size;
  final IconData? icon;

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
        InkWell(
          borderRadius: BorderRadius.circular(50),
          splashFactory: Utils.getSplashFactory(),
          onTap: _onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: widget.size ?? 20,
            height: widget.size ?? 20,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              border: Border.all(
                color: _getBorderColor(),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: widget.value == widget.groupValue
                ? Icon(_getIcon(),
                    color: CuReDesign.whiteColor, size: _getIconSize())
                : null,
          ),
        ),
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CuReText(
              widget.label!,
              color: widget.color ?? CuReDesign.textColor,
            ),
          )
      ],
    );
  }

  void _onTap() {
    if (_isToggable()) {
      widget.onChanged(widget.value);
    }
  }

  IconData _getIcon() {
    if (widget.icon != null) {
      return widget.icon!;
    }
    return CuReIcons.circle;
  }

  double _getIconSize() {
    if (widget.size != null) {
      if (widget.icon != null) {
        return widget.size! * 0.8;
      } else {
        return widget.size! * 0.45;
      }
    }
    if (widget.icon != null) {
      return 16;
    }
    return 10;
  }

  Color _getBackgroundColor() {
    if (widget.disabled != null && widget.disabled!) {
      return CuReDesign.disabledColor;
    }
    if (widget.value == widget.groupValue) {
      return widget.color ?? CuReDesign.primaryColor;
    }
    return Colors.transparent;
  }

  bool _isToggable() {
    return widget.disabled == null || !widget.disabled!;
  }

  Color _getBorderColor() {
    if (widget.disabled != null && widget.disabled!) {
      return CuReDesign.disabledColor;
    }
    if (widget.color != null) {
      return widget.color!;
    }
    if (widget.value == widget.groupValue) {
      return CuReDesign.primaryColor;
    }
    return Colors.grey;
  }
}
