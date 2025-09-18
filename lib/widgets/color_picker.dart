import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReColorPicker extends StatefulWidget {
  const CuReColorPicker({
    super.key,
    required this.colors,
    this.selectedColor,
    this.label,
    this.spaceBetween,
    this.onSelected,
    this.withoutDialog = false,
  });
  final List<Color> colors;
  final Color? selectedColor;
  final String? label;
  final bool? spaceBetween;
  final Function(Color)? onSelected;
  final bool? withoutDialog;

  @override
  State<CuReColorPicker> createState() => _CuReColorPickerState();
}

class _CuReColorPickerState extends State<CuReColorPicker> {
  Color selectedColor = const Color(0xFF000000);

  @override
  void initState() {
    if (widget.selectedColor != null) {
      selectedColor = widget.selectedColor!;
    } else {
      selectedColor = widget.colors.isNotEmpty
          ? widget.colors.first
          : const Color(0xFF000000);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: widget.spaceBetween == null || widget.spaceBetween == false
          ? MainAxisSize.min
          : MainAxisSize.max,
      mainAxisAlignment:
          widget.spaceBetween == null || widget.spaceBetween == false
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
      children: [
        if (widget.label != null &&
            widget.spaceBetween != null &&
            widget.spaceBetween == true)
          CuReText(
            widget.label!,
          ),
        Material(
            color: Colors.transparent,
            child: widget.withoutDialog != null && widget.withoutDialog!
                ? _getColorsList()
                : InkWell(
                    borderRadius: BorderRadius.circular(50),
                    splashFactory: Utils.getSplashFactory(),
                    onTap: () async {
                      CuReUtils.openDialog(
                        context: context,
                        actions: [
                          CuReDialogAction(
                              label: Localization.getValue('close'),
                              onPressed: () {})
                        ],
                        content: _getColorsGrid(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Ink(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        if (widget.label != null &&
            (widget.spaceBetween == null || widget.spaceBetween == false))
          CuReText(
            widget.label!,
            padding: const EdgeInsets.only(
              left: 12,
            ),
          ),
      ],
    );
  }

  Widget _getColorsList() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              widget.colors.map((color) => _generateColor(color)).toList(),
        ),
      ),
    );
  }

  Widget _getColorsGrid() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: widget.colors.length > 5 ? widget.colors.length / 5 * 45 : 45,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: widget.colors.length,
        itemBuilder: (context, index) {
          final color = widget.colors[index];
          return _generateColor(color);
        },
      ),
    );
  }

  Widget _generateColor(Color color) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashFactory: Utils.getSplashFactory(),
        onTap: () {
          setState(() {
            selectedColor = color;
          });
          if (widget.onSelected != null) {
            widget.onSelected!(color);
          }
          if (widget.withoutDialog == null || widget.withoutDialog == false) {
            CuReUtils.navigateBack(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Ink(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: widget.withoutDialog != null &&
                    widget.withoutDialog! &&
                    selectedColor == color
                ? Icon(
                    CuReIcons.check,
                    color: Colors.white,
                    size: 20,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
