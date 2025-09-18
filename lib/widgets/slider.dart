import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReSlider extends StatefulWidget {
  const CuReSlider({
    super.key,
    this.onChanged,
    this.value,
    this.min,
    this.max,
    this.thumbColor,
    this.activeColor,
  });

  final Function(double)? onChanged;
  final double? value;
  final double? min;
  final double? max;
  final Color? thumbColor;
  final Color? activeColor;

  @override
  State<CuReSlider> createState() => _CuReSliderState();
}

class _CuReSliderState extends State<CuReSlider> {
  double _value = 0;

  @override
  void initState() {
    setState(() {
      _value = widget.value ?? 0.5;
    });
    super.initState();
  }

  @override
  didUpdateWidget(CuReSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        _value = widget.value ?? 0.5;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (CuReUtils.isIos()) {
      return CupertinoSlider(
        value: _value,
        min: widget.min ?? 0,
        max: widget.max ?? 1,
        thumbColor: widget.thumbColor ?? CuReDesign.primaryColor,
        activeColor: widget.activeColor ?? CuReDesign.primaryColor,
        onChanged: (double value) {
          setState(() {
            _value = value;
          });
          if (widget.onChanged != null) widget.onChanged!(value);
        },
      );
    } else {
      return Slider(
        value: _value,
        min: widget.min ?? 0,
        max: widget.max ?? 1,
        thumbColor: widget.thumbColor ?? CuReDesign.primaryColor,
        activeColor: widget.activeColor ?? CuReDesign.primaryColor,
        onChanged: (double value) {
          setState(() {
            _value = value;
          });
          if (widget.onChanged != null) widget.onChanged!(value);
        },
      );
    }
  }
}
