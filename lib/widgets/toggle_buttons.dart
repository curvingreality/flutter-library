import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReToggleButtons extends StatefulWidget {
  const CuReToggleButtons({
    super.key,
    required this.options,
    this.onToggle,
    this.shape,
    this.allowJustOne,
    this.size,
    this.textColor,
  });

  final List<CuReToggleButtonsItem> options;
  final Function(CuReToggleButtonsItem)? onToggle;
  final CuReShape? shape;
  final bool? allowJustOne;
  final double? size;
  final Color? textColor;

  @override
  State<CuReToggleButtons> createState() => _CuReToggleButtonsState();
}

class _CuReToggleButtonsState extends State<CuReToggleButtons> {
  List<int> _selectedOptions = [];
  double _size = 16;

  @override
  void initState() {
    _loadSelectedOptions();
    if (widget.size != null) {
      _size = widget.size!;
    }
    super.initState();
  }

  @override
  didUpdateWidget(CuReToggleButtons oldWidget) {
    _loadSelectedOptions();
    super.didUpdateWidget(oldWidget);
  }

  void _loadSelectedOptions() {
    _selectedOptions = widget.options
        .asMap()
        .entries
        .where(
          (entry) => entry.value.isSelected != null && entry.value.isSelected!,
        )
        .map((entry) => entry.key)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.options
          .asMap()
          .map(
            (i, option) => MapEntry(
              i,
              Material(
                color: Colors.transparent,
                borderRadius: _getBorderRadius(i),
                child: Ink(
                  decoration: BoxDecoration(
                    border: _getBorder(i),
                    borderRadius: _getBorderRadius(i),
                    color: _selectedOptions.contains(i)
                        ? option.color != null
                            ? option.color!
                            : CuReDesign.primaryColor
                        : Colors.transparent,
                  ),
                  child: InkWell(
                    splashFactory: Utils.getSplashFactory(),
                    borderRadius: _getBorderRadius(i),
                    onTap: option.isDisabled == null || !option.isDisabled!
                        ? () {
                            if (widget.allowJustOne != null &&
                                widget.allowJustOne!) {
                              setState(() {
                                _selectedOptions = [i];
                              });
                            } else {
                              setState(() {
                                if (_selectedOptions.contains(i)) {
                                  _selectedOptions.remove(i);
                                } else {
                                  _selectedOptions.add(i);
                                }
                              });
                            }
                            if (widget.onToggle != null) {
                              widget.onToggle!(option);
                            }
                          }
                        : null,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: _size * 0.8,
                        vertical: _size * 0.5,
                      ),
                      child: option.icon != null
                          ? Icon(
                              option.icon,
                              color: _getColor(i),
                              size: _size * 1.5,
                            )
                          : CuReText(
                              option.label!,
                              color: _getColor(i),
                              size: _size,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }

  Color _getColor(int i) {
    if (widget.options[i].isDisabled != null && widget.options[i].isDisabled!) {
      return CuReDesign.disabledColor;
    }
    if (widget.textColor != null) {
      return widget.textColor!;
    }
    if (_selectedOptions.contains(i)) {
      return Colors.white;
    }
    if (widget.options[i].color != null) {
      return widget.options[i].color!;
    }
    if (CuReDesign.useDarkMode) {
      return Colors.white;
    }
    return CuReDesign.textColor;
  }

  Color _getBorderColor(int i) {
    if (CuReDesign.useDarkMode) {
      return CuReUtils.darken(Colors.grey, 0.3);
    } else {
      return Colors.grey.shade400;
    }
  }

  Border _getBorder(int i) {
    final border = BorderSide(color: _getBorderColor(i));
    return Border(
      top: border,
      bottom: border,
      left: i == 0 ? border : BorderSide.none,
      right: border,
    );
  }

  BorderRadius? _getBorderRadius(int i) {
    if (i == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(
          Utils.getBorderRadiusNumber(widget.shape),
        ),
        bottomLeft: Radius.circular(
          Utils.getBorderRadiusNumber(widget.shape),
        ),
      );
    }
    if (i == widget.options.length - 1) {
      return BorderRadius.only(
        topRight: Radius.circular(
          Utils.getBorderRadiusNumber(widget.shape),
        ),
        bottomRight: Radius.circular(
          Utils.getBorderRadiusNumber(widget.shape),
        ),
      );
    }
    return null;
  }
}
