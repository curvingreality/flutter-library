import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReChipChoice extends StatefulWidget {
  const CuReChipChoice({
    super.key,
    this.selected,
    required this.items,
    required this.onSelect,
    this.shape,
  });

  final dynamic selected;
  final List<CuReChipChoiceItem> items;
  final Function(dynamic) onSelect;
  final CuReShape? shape;

  @override
  State<CuReChipChoice> createState() => _CuReChipChoiceState();
}

class _CuReChipChoiceState extends State<CuReChipChoice> {
  dynamic selectedValue;

  @override
  void initState() {
    if (widget.selected != null) {
      selectedValue = widget.selected;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(
        widget.items.length,
        (int index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                borderRadius: Utils.getBorderRadius(
                  widget.shape,
                ),
                splashFactory: Utils.getSplashFactory(),
                onTap: widget.items[index].disabled != null &&
                        widget.items[index].disabled!
                    ? null
                    : () {
                        setState(() {
                          if (widget.items[index].value == selectedValue) {
                            selectedValue = null;
                            widget.onSelect(null);
                            return;
                          }
                          selectedValue = widget.items[index].value;
                          widget.onSelect(selectedValue);
                        });
                      },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    color: _getChipColor(
                      widget.items[index],
                    ),
                    border: Border.all(
                      color: _getBorderColor(
                        widget.items[index],
                      ),
                    ),
                    borderRadius: Utils.getBorderRadius(widget.shape),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  duration: const Duration(milliseconds: 100),
                  child: Row(
                    children: [
                      if (widget.items[index].icon != null)
                        Row(
                          children: [
                            Icon(
                              widget.items[index].icon,
                              color: _getTextColor(
                                widget.items[index],
                              ),
                              size: 18,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      if (widget.items[index].label != null)
                        Text(
                          widget.items[index].label!,
                          style: TextStyle(
                            color: _getTextColor(
                              widget.items[index],
                            ),
                            fontSize: 16,
                          ),
                        )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          );
        },
      ),
    );
  }

  Color? _getChipColor(CuReChipChoiceItem item) {
    if (item.disabled != null && item.disabled!) {
      return CuReDesign.disabledColor.withAlpha(140);
    }
    if (item.value == selectedValue) {
      if (item.color != null) {
        return item.color!;
      } else {
        return CuReDesign.primaryColor;
      }
    }
    if (item.solid != null && item.solid!) {
      if (item.color != null) {
        return item.color!.withAlpha(40);
      } else {
        return CuReDesign.primaryColor.withAlpha(40);
      }
    }
    return null;
  }

  Color _getBorderColor(CuReChipChoiceItem item) {
    if (item.solid != null && item.solid!) {
      return Colors.transparent;
    }
    if (item.disabled != null && item.disabled!) {
      return CuReDesign.disabledColor.withAlpha(140);
    }
    if (item.color != null) {
      return item.color!;
    } else {
      return CuReDesign.primaryColor;
    }
  }

  Color _getTextColor(CuReChipChoiceItem item) {
    if (item.disabled != null && item.disabled!) {
      return CuReDesign.textColor.withAlpha(100);
    }
    if (item.value == selectedValue) {
      return Colors.white;
    }
    if (item.color != null) {
      return item.color!;
    } else {
      return CuReDesign.primaryColor;
    }
  }
}
