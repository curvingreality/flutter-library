import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReCheckbox extends StatefulWidget {
  const CuReCheckbox({
    super.key,
    this.checked,
    this.onChanged,
    this.color,
    this.label,
    this.disabled,
    this.size,
    this.icon,
  });

  final bool? checked;
  final Function? onChanged;
  final Color? color;
  final String? label;
  final bool? disabled;
  final double? size;
  final IconData? icon;

  @override
  State<CuReCheckbox> createState() => _CuReCheckboxState();
}

class _CuReCheckboxState extends State<CuReCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(CuReDesign.borderRadius / 2),
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
                borderRadius:
                    BorderRadius.circular(CuReDesign.borderRadius / 2),
              ),
              child: widget.checked != null && widget.checked!
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
                color: _getTextColor(),
              ),
            )
        ]);
  }

  void _onTap() {
    if (widget.onChanged != null && _isToggable()) {
      widget.onChanged!(!(widget.checked ?? false));
    }
  }

  Color _getTextColor() {
    if (widget.color != null) {
      return widget.color!;
    }
    if (CuReDesign.useDarkMode) {
      return CuReDesign.whiteColor;
    }
    return CuReDesign.textColor;
  }

  IconData _getIcon() {
    if (widget.icon != null) {
      return widget.icon!;
    }
    return CuReIcons.check;
  }

  double _getIconSize() {
    if (widget.size != null) {
      return widget.size! * 0.8;
    }
    return 16;
  }

  Color _getBackgroundColor() {
    if (widget.disabled != null && widget.disabled!) {
      return CuReDesign.disabledColor;
    }
    if (widget.checked != null && widget.checked!) {
      return widget.color ?? CuReDesign.primaryColor;
    }
    return Colors.transparent;
  }

  Color _getBorderColor() {
    if (widget.disabled != null && widget.disabled!) {
      return CuReDesign.disabledColor;
    }
    if (widget.color != null) {
      return widget.color!;
    }
    if (widget.checked != null && widget.checked!) {
      return CuReDesign.primaryColor;
    }
    return Colors.grey;
  }

  bool _isToggable() {
    return widget.disabled == null || !widget.disabled!;
  }
}
