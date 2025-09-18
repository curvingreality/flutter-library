import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReButton extends StatefulWidget {
  const CuReButton({
    super.key,
    this.type,
    this.shape,
    this.label,
    this.icon,
    this.iconPosition,
    this.onPressed,
    this.isLoading,
    this.minSize,
    this.child,
    this.disabled,
    this.color,
    this.customPrefix,
    this.iconSize,
    this.padding,
    this.margin,
    this.size,
  });

  final CuReButtonType? type;
  final CuReShape? shape;
  final String? label;
  final IconData? icon;
  final CuReIconPosition? iconPosition;
  final Function? onPressed;
  final bool? isLoading;
  final Size? minSize;
  final Widget? child;
  final bool? disabled;
  final Color? color;
  final Widget? customPrefix;
  final double? iconSize;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final CuReButtonSize? size;

  @override
  State<CuReButton> createState() => _CuReButtonState();
}

class _CuReButtonState extends State<CuReButton> {
  @override
  Widget build(BuildContext context) {
    return _getChild();
  }

  Widget _getChild() {
    if (widget.type == CuReButtonType.outlined) {
      return _getSecondaryButton();
    }
    if (widget.type == CuReButtonType.text) {
      return _getTextButton();
    }
    return _getPrimaryButton();
  }

  Widget _getPrimaryButton() {
    return Padding(
        padding: widget.margin ?? EdgeInsets.zero,
        child: ElevatedButton(
          style: _getButtonStyle(),
          onPressed: _getOnPressed(),
          child: _getButtonContent(),
        ));
  }

  Widget _getTextButton() {
    return Padding(
        padding: widget.margin ?? EdgeInsets.zero,
        child: TextButton(
          onPressed: _getOnPressed(),
          style: _getButtonStyle(),
          child: _getButtonContent(),
        ));
  }

  Widget _getSecondaryButton() {
    return Padding(
        padding: widget.margin ?? EdgeInsets.zero,
        child: OutlinedButton(
          onPressed: _getOnPressed(),
          style: _getButtonStyle(),
          child: _getButtonContent(),
        ));
  }

  Widget _getButtonContent() {
    return Padding(
      padding: _getPadding(),
      child: widget.isLoading != null && widget.isLoading!
          ? SizedBox(
              width: 22,
              height: 22,
              child: _getProgressIndicator(),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Child
                if (widget.child != null) ...[
                  widget.child!

                  // Prefix
                ] else if (_isPrefix()) ...[
                  if (widget.icon != null) _getIcon(),
                  if (widget.customPrefix != null) widget.customPrefix!,
                  const SizedBox(
                    width: 6,
                  ),
                  _getText(),

                  // Suffix
                ] else if (widget.iconPosition == CuReIconPosition.suffix) ...[
                  _getText(),
                  const SizedBox(
                    width: 6,
                  ),
                  _getIcon(),

                  // Icon only
                ] else if (widget.icon != null && widget.label == null) ...[
                  _getIcon(),

                  // Label only
                ] else if (widget.icon == null && widget.label != null) ...[
                  _getText(),
                ],
              ],
            ),
    );
  }

  bool _isPrefix() {
    return (((widget.icon != null && widget.iconPosition == null) ||
                widget.customPrefix != null) ||
            widget.iconPosition == CuReIconPosition.prefix) &&
        widget.label != null;
  }

  Widget _getIcon() {
    return Icon(
      widget.icon,
      color: _getTextColor(),
      size: _getIconSize(),
    );
  }

  double _getIconSize() {
    if (widget.iconSize != null) {
      return widget.iconSize!;
    }
    switch (widget.size) {
      case CuReButtonSize.large:
        return 24;
      case CuReButtonSize.small:
        return 16;
      case CuReButtonSize.medium:
      default:
        return 20;
    }
  }

  Text _getText() {
    return Text(
      widget.label!,
      style: TextStyle(
        color: _getTextColor(),
        fontSize: _getTextSize(),
      ),
    );
  }

  double _getTextSize() {
    switch (widget.size) {
      case CuReButtonSize.large:
        return 20;
      case CuReButtonSize.small:
        return 14;
      case CuReButtonSize.medium:
      default:
        return 16;
    }
  }

  Widget _getProgressIndicator() {
    if (CuReUtils.isIos()) {
      return CupertinoActivityIndicator(
        color: _getTextColor(),
        radius: 10,
      );
    } else {
      return CircularProgressIndicator(
        color: _getTextColor(),
        strokeWidth: 2,
      );
    }
  }

  dynamic _getOnPressed() {
    return widget.onPressed != null &&
            (widget.isLoading == null || !widget.isLoading!) &&
            (widget.disabled == null || !widget.disabled!)
        ? () => widget.onPressed!()
        : null;
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      shadowColor: CuReUtils.isIos()
          ? WidgetStateProperty.all(Colors.transparent)
          : null,
      backgroundColor:
          widget.type == null || widget.type == CuReButtonType.primary
              ? WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled) ||
                        (widget.isLoading != null && widget.isLoading!)) {
                      if (CuReDesign.useDarkMode) {
                        return CuReUtils.darken(CuReDesign.disabledColor, 0.5);
                      } else {
                        return CuReDesign.disabledColor;
                      }
                    } else {
                      if (widget.color != null) {
                        return widget.color!;
                      }
                      return CuReDesign.primaryColor;
                    }
                  },
                )
              : null,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor: WidgetStateProperty.all(_getOverlayColor()),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
      minimumSize: widget.icon != null && widget.label == null
          ? WidgetStateProperty.all(widget.minSize ?? const Size(0, 0))
          : WidgetStateProperty.all(
              widget.minSize ??
                  Size(
                    widget.size == null || widget.size != CuReButtonSize.small
                        ? 150
                        : 0,
                    0,
                  ),
            ),
      splashFactory: Utils.getSplashFactory(),
      side: widget.type == CuReButtonType.outlined
          ? WidgetStateProperty.all(
              BorderSide(
                width: 1,
                color: (widget.onPressed != null &&
                        (widget.isLoading == null || !widget.isLoading!) &&
                        (widget.disabled == null || !widget.disabled!))
                    ? widget.color ?? CuReDesign.primaryColor
                    : CuReDesign.useDarkMode
                        ? CuReUtils.darken(CuReDesign.disabledColor, 0.5)
                        : CuReDesign.disabledColor,
              ),
            )
          : null,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: Utils.getBorderRadius(widget.shape),
        ),
      ),
    );
  }

  Color? _getOverlayColor() {
    if (widget.color != null) {
      if (widget.type == null || widget.type == CuReButtonType.primary) {
        return CuReUtils.darken(widget.color!, 0.15);
      } else {
        return widget.color!.withAlpha(50);
      }
    }
    return widget.type == null || widget.type == CuReButtonType.primary
        ? CuReUtils.darken(CuReDesign.primaryColor, 0.15)
        : CuReDesign.primaryColor.withAlpha(50);
  }

  Color? _getTextColor() {
    if (((widget.type == CuReButtonType.text ||
                widget.type == CuReButtonType.outlined) &&
            widget.onPressed == null) ||
        (widget.type == CuReButtonType.outlined ||
                widget.type == CuReButtonType.text) &&
            ((widget.isLoading != null && widget.isLoading!) ||
                (widget.disabled != null && widget.disabled!))) {
      if (CuReDesign.useDarkMode) {
        return CuReUtils.darken(CuReDesign.disabledColor, 0.5);
      } else {
        return CuReDesign.disabledColor;
      }
    }
    if (widget.color != null &&
        (widget.type != null && widget.type != CuReButtonType.primary)) {
      return widget.color;
    }
    if (widget.type == null || widget.type == CuReButtonType.primary) {
      return Colors.white;
    } else {
      return CuReDesign.primaryColor;
    }
  }

  EdgeInsets _getPadding() {
    if (widget.padding != null) {
      return widget.padding!;
    }
    if (widget.label == null) {
      return const EdgeInsets.symmetric(horizontal: 4, vertical: 4);
    }
    switch (widget.size) {
      case CuReButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 22, vertical: 16);
      case CuReButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 14, vertical: 10);
      case CuReButtonSize.medium:
      default:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 13);
    }
  }
}
