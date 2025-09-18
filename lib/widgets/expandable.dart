import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReExpandableBox extends StatefulWidget {
  const CuReExpandableBox({
    super.key,
    required this.title,
    required this.child,
    this.filled = true,
    this.color,
    this.icon,
    this.shape,
    this.onTap,
  });

  final String title;
  final Widget child;
  final bool filled;
  final Color? color;
  final IconData? icon;
  final CuReShape? shape;
  final Function? onTap;

  @override
  State<CuReExpandableBox> createState() => _CuReExpandableBoxState();
}

class _CuReExpandableBoxState extends State<CuReExpandableBox>
    with TickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    super.initState();
  }

  _toggleContainer() {
    if (!_isOpen) {
      _controller.forward();
    } else {
      _controller.animateBack(0,
          duration:
              CuReDesign.animationDurations[CuReAnimationDuration.medium]!);
    }
    _isOpen = !_isOpen;
    if (widget.onTap != null) {
      widget.onTap!(_isOpen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Utils.getBorderRadius(widget.shape),
      splashFactory: Utils.getSplashFactory(),
      onTap: () => setState(() => _toggleContainer()),
      child: Ink(
        decoration: BoxDecoration(
          color: widget.filled
              ? widget.color != null
                  ? widget.color!.withValues(alpha: 0.1)
                  : CuReDesign.primaryColor.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: Utils.getBorderRadius(widget.shape),
          boxShadow: [
            BoxShadow(
              color: CuReDesign.useDarkMode
                  ? Colors.black.withValues(alpha: 0.35)
                  : Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: CuReDesign.spacing,
            horizontal: CuReDesign.spacing * 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (widget.icon != null)
                        Padding(
                          padding: EdgeInsets.only(right: CuReDesign.spacing),
                          child: Icon(
                            widget.icon,
                            color: widget.color ?? CuReDesign.primaryColor,
                            size: 20,
                          ),
                        ),
                      CuReText(
                        widget.title,
                        lineHeight: 0,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  AnimatedRotation(
                    turns: _isOpen ? 0.5 : 0,
                    duration: CuReDesign
                        .animationDurations[CuReAnimationDuration.medium]!,
                    child: Icon(
                      Icons.expand_more,
                      color: CuReDesign.useDarkMode
                          ? Colors.white
                          : CuReDesign.textColor,
                    ),
                  )
                ],
              ),
              SizeTransition(
                sizeFactor: _animation,
                axis: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: CuReDesign.spacing / 2,
                    bottom: CuReDesign.spacing / 3,
                  ),
                  child: widget.child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
