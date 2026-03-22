import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReBottomNavigationBar extends StatefulWidget {
  const CuReBottomNavigationBar(
      {super.key,
      required this.items,
      this.onTap,
      required this.currentIndex,
      this.backgroundColor,
      this.selectedColor,
      this.unselectedColor,
      this.showSelectedLabel = true,
      this.showUnselectedLabel,
      this.horizontalLayout = true,
      this.shape = CuReShape.rounded});

  final List<CuReBottomNavigationBarItem> items;
  final Function(int)? onTap;
  final int currentIndex;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final bool? showSelectedLabel;
  final bool? showUnselectedLabel;
  final bool? horizontalLayout;
  final CuReShape? shape;

  @override
  State<CuReBottomNavigationBar> createState() =>
      _CuReBottomNavigationBarState();
}

class _CuReBottomNavigationBarState extends State<CuReBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 81 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom > 0
              ? MediaQuery.of(context).padding.bottom
              : 10,
          top: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items.map((item) {
            int index = widget.items.indexOf(item);
            bool isSelected = index == widget.currentIndex;
            return InkWell(
                borderRadius:
                    BorderRadius.circular(_getBorderRadius(isSelected)),
                radius: _getBorderRadius(isSelected),
                splashFactory: Utils.getSplashFactory(),
                highlightColor: _getHighlighColor(item),
                focusColor: _getHighlighColor(item),
                splashColor: _getHighlighColor(item),
                onTap: () {
                  if (widget.onTap != null) {
                    widget.onTap!(index);
                  }
                },
                child: AnimatedContainer(
                    duration: _containerDuration,
                    curve: Curves.easeOutCubic,
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.horizontalLayout == true
                          ? (isSelected ? 14 : 10)
                          : 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(_getBorderRadius(isSelected)),
                      color: _getItemBackgroundColor(item, isSelected),
                    ),
                    child: widget.horizontalLayout != null &&
                            widget.horizontalLayout == true
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: _getItem(item, isSelected),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: _getItem(item, isSelected),
                          )));
          }).toList()),
    );
  }

  Color _getHighlighColor(CuReBottomNavigationBarItem item) {
    if (item.color != null) {
      return item.color!.withAlpha(25);
    }
    return CuReDesign.primaryColor.withAlpha(25);
  }

  Color _getBackgroundColor() {
    if (widget.backgroundColor != null) {
      return widget.backgroundColor!;
    }
    if (CuReDesign.useDarkMode) {
      return const Color(0xff090909);
    }
    return CuReDesign.primaryColor.withAlpha(20);
  }

  Color _getItemBackgroundColor(
      CuReBottomNavigationBarItem item, bool isSelected) {
    if (widget.horizontalLayout == true && isSelected) {
      return _getColor(item, true).withValues(alpha: 0.12);
    }
    return Colors.transparent;
  }

  double _getFontSize() {
    if (widget.horizontalLayout == true) {
      return 14;
    }
    return 12;
  }

  Duration get _containerDuration {
    if (widget.horizontalLayout == true) {
      return const Duration(milliseconds: 300);
    }
    return const Duration(milliseconds: 200);
  }

  double _getIconSize(bool isSelected) {
    if (widget.horizontalLayout == true) {
      return 22;
    }
    if (widget.showSelectedLabel == true && isSelected) {
      return 22;
    }
    if (widget.showUnselectedLabel == true && !isSelected) {
      return 24;
    }
    return 28;
  }

  double _getBorderRadius(bool isSelected) {
    return Utils.getBorderRadiusNumber(
        widget.shape ?? CuReDesign.defaultElementsShape);
  }

  List<Widget> _getItem(CuReBottomNavigationBarItem item, bool isSelected) {
    final bool showLabel = (isSelected &&
                ((widget.showSelectedLabel != null &&
                        widget.showSelectedLabel!) ||
                    !isSelected &&
                        (widget.showUnselectedLabel != null &&
                            widget.showUnselectedLabel!)) ||
            (isSelected &&
                widget.horizontalLayout != null &&
                widget.horizontalLayout!)) ||
        (widget.showUnselectedLabel == true &&
            (widget.horizontalLayout == null ||
                widget.horizontalLayout == false));
    return [
      if ((item.icon != null &&
              (item.activeWidgetIcon == null ||
                  !isSelected && item.activeWidgetIcon != null)) ||
          (item.activeIcon != null && isSelected))
        CuReIcon(
          isSelected && item.activeIcon != null ? item.activeIcon! : item.icon!,
          size: _getIconSize(isSelected),
          color: _getColor(item, isSelected),
        ),
      if (item.widgetIcon != null && !isSelected) item.widgetIcon!,
      if (item.activeWidgetIcon != null && isSelected) item.activeWidgetIcon!,
      ClipRect(
        child: AnimatedSize(
          duration:
              Duration(milliseconds: widget.horizontalLayout == true ? 300 : 1),
          curve: Curves.easeOutCubic,
          alignment: Alignment.centerLeft,
          child: showLabel
              ? AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: widget.horizontalLayout == true ? 8 : 0,
                      top: widget.horizontalLayout == null ||
                              widget.horizontalLayout == false
                          ? 3
                          : 0,
                    ),
                    child: item.label != null
                        ? CuReText(
                            lineHeight: 0,
                            item.label!,
                            size: _getFontSize(),
                            color: _getColor(item, isSelected),
                            weight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          )
                        : null,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    ];
  }

  Color _getColor(CuReBottomNavigationBarItem item, bool isSelected) {
    if (item.color != null) {
      if (isSelected) {
        return item.color!;
      }
      return item.color!.withAlpha(120);
    }
    if (isSelected) {
      return widget.selectedColor ?? CuReDesign.primaryColor;
    }
    if (widget.unselectedColor != null) {
      return widget.unselectedColor!;
    }
    return CuReDesign.primaryColor.withAlpha(120);
  }
}
