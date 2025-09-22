import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

enum DropdownDirection { auto, down, up }

class CuReDropdown extends StatefulWidget {
  final List<CuReDropdownItem> items;
  final int? selectedIndex;
  final ValueChanged<CuReDropdownItem> onChanged;
  final bool? showSelectedItem;
  final Icon? icon;
  final Color? color;
  final bool? showBorder;
  final bool? solid;
  final String? title;
  final bool? disabled;
  final BuildContext? context;

  final double dropdownWidth;
  final double dropdownMaxHeight;
  final double edgePadding;
  final DropdownDirection preferDirection;

  const CuReDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.selectedIndex,
    this.dropdownWidth = 200,
    this.dropdownMaxHeight = 260,
    this.edgePadding = 8,
    this.preferDirection = DropdownDirection.auto,
    this.icon,
    this.showSelectedItem = true,
    this.color,
    this.showBorder = false,
    this.title,
    this.solid,
    this.disabled,
    this.context,
  }) : super(key: key);

  @override
  State<CuReDropdown> createState() => _CuReDropdownState();
}

class _CuReDropdownState extends State<CuReDropdown>
    with SingleTickerProviderStateMixin {
  static const double _itemExtent = 44;

  final LayerLink _link = LayerLink();
  OverlayEntry? _entry;

  late final AnimationController _controller;
  late final Animation<double> _fade =
      CurvedAnimation(parent: _controller, curve: Curves.easeOut);

  Size _buttonSize = Size.zero;
  double buttonWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );
  }

  void _open() {
    if (_entry != null) return;
    final box = context.findRenderObject() as RenderBox;
    _buttonSize = box.size;
    _entry = _buildOverlay();
    Overlay.of(context, rootOverlay: true).insert(_entry!);
    _controller.forward();
  }

  void _close() async {
    if (_entry == null) return;
    await _controller.reverse();
    _entry?.remove();
    _entry = null;
  }

  void _toggle() => _entry == null ? _open() : _close();

  double _computeMenuWidth(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;
    double maxWidth = 0;

    for (var item in widget.items) {
      final tp = TextPainter(
        text: TextSpan(text: item.label!, style: textStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();

      maxWidth = math.max(maxWidth, tp.width);
    }
    return maxWidth + 24;
  }

  OverlayEntry _buildOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final targetOffset = renderBox.localToGlobal(Offset.zero);
    final screenSize = MediaQuery.of(widget.context ?? context).size;

    final estimatedMenuHeight = math.min(
      widget.dropdownMaxHeight,
      widget.items.length * _itemExtent,
    );

    bool openUp;
    switch (widget.preferDirection) {
      case DropdownDirection.down:
        openUp = false;
        break;
      case DropdownDirection.up:
        openUp = true;
        break;
      case DropdownDirection.auto:
        final spaceBelow =
            screenSize.height - (targetOffset.dy + _buttonSize.height);
        openUp = spaceBelow < (estimatedMenuHeight + 12);
    }

    final Animation<Offset> slide = Tween<Offset>(
      begin: openUp ? const Offset(0, 0.02) : const Offset(0, -0.02),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    final menuWidth = _computeMenuWidth(context) + 48;
    double dxShift = 0;

    buttonWidth = calcButtonWidth(
        context: context,
        label: widget.selectedIndex != null
            ? widget.items[widget.selectedIndex!].label!
            : '');

    final rightEdge = targetOffset.dx + menuWidth;
    final maxRight = screenSize.width - widget.edgePadding;
    if (rightEdge > maxRight) {
      dxShift = -(menuWidth - buttonWidth);
    }
    final minLeft = widget.edgePadding;
    final leftAfterShift = targetOffset.dx + dxShift;
    if (leftAfterShift < minLeft) {
      dxShift = (menuWidth - buttonWidth);
    }

    return OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: Stack(
            children: [
              GestureDetector(
                onTap: _close,
                behavior: HitTestBehavior.translucent,
              ),
              CompositedTransformFollower(
                link: _link,
                offset: Offset(dxShift,
                    openUp ? -estimatedMenuHeight - 8 : _buttonSize.height + 8),
                showWhenUnlinked: false,
                child: FadeTransition(
                  opacity: _fade,
                  child: SlideTransition(
                    position: slide,
                    child: Material(
                        elevation: 8,
                        surfaceTintColor: CuReDesign.useDarkMode
                            ? CuReDesign.blackColor
                            : CuReDesign.whiteColor,
                        borderRadius:
                            BorderRadius.circular(CuReDesign.borderRadius),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: widget.dropdownMaxHeight,
                            minWidth: menuWidth,
                            maxWidth: menuWidth,
                          ),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            if (widget.title != null)
                              Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                      left: 14, top: 14, bottom: 5),
                                  child: Text(widget.title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ))),
                            SingleChildScrollView(
                                child: Container(
                              constraints: BoxConstraints(
                                maxHeight: widget.dropdownMaxHeight -
                                    (widget.title != null ? 40 : 0),
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemExtent: _itemExtent, // altezza costante
                                itemCount: widget.items.length,
                                itemBuilder: (context, index) {
                                  final item = widget.items[index];
                                  return InkWell(
                                    splashFactory: Utils.getSplashFactory(),
                                    onTap:
                                        item.disabled != null && item.disabled!
                                            ? null
                                            : () {
                                                widget.onChanged(item);
                                                _close();
                                              },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      alignment: Alignment.centerLeft,
                                      decoration: index <
                                              widget.items.length - 1
                                          ? const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    width: 0.6,
                                                    color: Color(0x11000000)),
                                              ),
                                            )
                                          : null,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (item.icon != null) ...[
                                            Icon(
                                              item.icon,
                                              size: 18,
                                              color: item.color,
                                            ),
                                            const SizedBox(width: 8),
                                          ],
                                          Expanded(
                                            child: Text(
                                              item.label!,
                                              style: TextStyle(
                                                color: item.disabled != null &&
                                                        item.disabled!
                                                    ? Colors.grey
                                                    : item.color,
                                                height: 0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ))
                          ]),
                        )),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _entry?.remove();
    _entry = null;
    _controller.dispose();
    super.dispose();
  }

  double calcButtonWidth({
    required BuildContext context,
    required String label,
    double horizontalPadding = 30,
    double iconWidth = 30,
    double minWidth = 40,
    double maxWidth = 240,
  }) {
    if (label != '' && widget.showSelectedItem == true) {
      final textStyle = Theme.of(context).textTheme.bodyMedium ??
          const TextStyle(fontSize: 14);

      final tp = TextPainter(
        text: TextSpan(text: label, style: textStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();

      final textWidth = tp.width;
      int itemIcon = 0;
      if (widget.selectedIndex != null &&
          widget.items[widget.selectedIndex!].icon != null) {
        itemIcon = 18;
      }
      final total = textWidth + horizontalPadding + iconWidth + itemIcon;
      return total.clamp(minWidth, maxWidth);
    } else {
      return minWidth;
    }
  }

  Color _getBorderColor() {
    if (widget.showBorder != true) {
      if (widget.solid == true) {
        return CuReDesign.primaryColor.withAlpha(20);
      }
    }
    if (widget.color != null) {
      // ignore: deprecated_member_use
      return widget.color!.withOpacity(0.5);
    }
    return Colors.transparent;
  }

  Color _getTextColor() {
    if (widget.disabled != null && widget.disabled!) {
      return CuReDesign.textColor.withAlpha(100);
    }
    if (widget.color != null) {
      return widget.color!;
    } else {
      return CuReDesign.primaryColor;
    }
  }

  Color? _getColor() {
    if (widget.disabled != null && widget.disabled!) {
      return CuReDesign.disabledColor.withAlpha(140);
    }
    if (widget.solid != null && widget.solid!) {
      if (widget.color != null) {
        return widget.color!.withAlpha(40);
      } else {
        return CuReDesign.primaryColor.withAlpha(40);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.selectedIndex != null;

    return CompositedTransformTarget(
      link: _link,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(CuReDesign.borderRadius),
        child: InkWell(
          splashFactory: Utils.getSplashFactory(),
          borderRadius: BorderRadius.circular(CuReDesign.borderRadius),
          onTap: widget.disabled != null && widget.disabled! ? null : _toggle,
          child: Ink(
            height: 39,
            width: calcButtonWidth(
                context: context,
                label: widget.selectedIndex != null
                    ? widget.items[widget.selectedIndex!].label!
                    : ''),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                color: _getColor(),
                borderRadius: BorderRadius.circular(CuReDesign.borderRadius),
                border: Border.all(color: _getBorderColor(), width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.showSelectedItem != null &&
                    widget.showSelectedItem!) ...[
                  if (hasValue) ...[
                    if (widget.items[widget.selectedIndex!].icon != null) ...[
                      Icon(
                        widget.items[widget.selectedIndex!].icon,
                        size: 18,
                        color: _getTextColor(),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                  Text(
                    hasValue ? widget.items[widget.selectedIndex!].label! : '',
                    style: TextStyle(
                        color: _getTextColor(),
                        fontWeight:
                            hasValue ? FontWeight.w600 : FontWeight.w400,
                        height: 0),
                  ),
                  const SizedBox(width: 8),
                ],
                widget.icon ??
                    Icon(
                      CuReIcons.chevronDown,
                      size: 18,
                      color: _getTextColor(),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
