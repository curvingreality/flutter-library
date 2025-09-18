import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReCheckbox extends StatefulWidget {
  const CuReCheckbox({
    super.key,
    this.checked,
    this.onChanged,
    this.color,
    this.label,
    this.disabled,
  });

  final bool? checked;
  final Function? onChanged;
  final Color? color;
  final String? label;
  final bool? disabled;

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
          if (CuReUtils.isIos()) _getIosCheckbox(),
          if (!CuReUtils.isIos()) _getAndroidCheckbox(),
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CuReText(widget.label!),
            )
        ]);
  }

  Widget _getIosCheckbox() {
    return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 20, height: 20),
        child: CupertinoCheckbox(
          activeColor: widget.color ?? CuReDesign.primaryColor,
          value: widget.checked ?? false,
          onChanged: widget.onChanged != null && _isToggable()
              ? (value) => widget.onChanged!(value)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              CuReDesign.borderRadius / 2,
            ),
          ),
          side: BorderSide(
            width: 1.0,
            color: _getBorderColor(),
          ),
        ));
  }

  Widget _getAndroidCheckbox() {
    return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 20, height: 20),
        child: Checkbox(
          activeColor: widget.color ?? CuReDesign.primaryColor,
          value: widget.checked ?? false,
          onChanged: widget.onChanged != null && _isToggable()
              ? (value) => widget.onChanged!(value)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              CuReDesign.borderRadius / 2,
            ),
          ),
          side: BorderSide(
            width: 1.0,
            color: _getBorderColor(),
          ),
        ));
  }

  Color _getBorderColor() {
    return widget.disabled != null && widget.disabled!
        ? Colors.grey.withAlpha(70)
        : Colors.grey;
  }

  bool _isToggable() {
    return widget.disabled == null || !widget.disabled!;
  }
}
