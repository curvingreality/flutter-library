import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';

class CuRePicker extends StatefulWidget {
  const CuRePicker(
      {super.key,
      required this.selectedIndex,
      this.onSelected,
      required this.options,
      this.label,
      this.height,
      this.itemExtent});

  final int selectedIndex;
  final Function(int)? onSelected;
  final List<String> options;
  final String? label;
  final double? height;
  final double? itemExtent;

  @override
  State<CuRePicker> createState() => _CuRePickerState();
}

class _CuRePickerState extends State<CuRePicker> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.label != null
            ? CuReText(
                widget.label!,
                size: 17,
                weight: FontWeight.w600,
              )
            : const SizedBox(),
        SizedBox(
          height: widget.height ??
              (widget.itemExtent != null
                  ? widget.itemExtent! * widget.options.length
                  : 150),
          child: _getPicker(),
        )
      ],
    );
  }

  Widget _getPicker() {
    if (CuReUtils.isIos()) {
      return CupertinoPicker(
        itemExtent: widget.itemExtent ?? 40,
        scrollController: FixedExtentScrollController(
          initialItem: selectedIndex,
        ),
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onSelected?.call(index);
        },
        children: widget.options
            .map((e) => Center(
                  child: CuReText(
                    e,
                    size: 16,
                  ),
                ))
            .toList(),
      );
    } else {
      return ListWheelScrollView.useDelegate(
        itemExtent: widget.itemExtent ?? 40,
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onSelected?.call(index);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (BuildContext context, int index) {
            return Center(
              child: CuReText(
                widget.options[index],
                size: 16,
              ),
            );
          },
          childCount: widget.options.length,
        ),
      );
    }
  }
}
