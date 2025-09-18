import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:flutter/material.dart';

class CuReStepper extends StatefulWidget {
  const CuReStepper({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.onStepChange,
    this.hideNumbers,
    this.hideSeparators,
    this.separatorSize,
    this.shape,
    this.disabled,
    this.color,
    this.readonly,
    this.vertical,
  });

  final int totalSteps;
  final int currentStep;
  final Function(int)? onStepChange;
  final bool? hideNumbers;
  final bool? hideSeparators;
  final int? separatorSize;
  final CuReShape? shape;
  final bool? disabled;
  final Color? color;
  final bool? readonly;
  final bool? vertical;

  @override
  State<CuReStepper> createState() => _CuReStepperState();
}

class _CuReStepperState extends State<CuReStepper> {
  final int _selectedAlpha = 130;

  @override
  Widget build(BuildContext context) {
    if (widget.vertical != null && widget.vertical!) {
      return Column(
        children: _getContent(),
      );
    } else {
      return Row(
        children: _getContent(),
      );
    }
  }

  List<Widget> _getContent() {
    return List.generate(widget.totalSteps, (index) {
      if (widget.vertical != null && widget.vertical!) {
        return Column(
          children: _getInnerContent(index),
        );
      } else {
        return Row(
          children: _getInnerContent(index),
        );
      }
    });
  }

  List<Widget> _getInnerContent(int index) {
    return [
      GestureDetector(
        onTap: () => _goToStep(index),
        child: AnimatedContainer(
          duration:
              CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
          curve: Curves.easeIn,
          width: _getWidth(index),
          height: _getHeight(index),
          decoration: BoxDecoration(
            color: _getColor(index),
            borderRadius: BorderRadius.circular(
              _getBorderRadius(),
            ),
          ),
          child: widget.hideNumbers == null || !widget.hideNumbers!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                )
              : null,
        ),
      ),

      if (widget.vertical != null && widget.vertical!)
        const SizedBox(
          height: 4,
        )
      else
        const SizedBox(
          width: 4,
        ),

      // Dashes separator
      if ((widget.hideSeparators == null || !widget.hideSeparators!) &&
          index < widget.totalSteps - 1)
        _getSeparator(index)
    ];
  }

  Widget _getSeparator(int step) {
    int size = 3;
    if (widget.separatorSize != null) {
      size = widget.separatorSize!;
    }
    if (widget.vertical != null && widget.vertical!) {
      return Column(
        children: _getSeparatorContent(size, step),
      );
    } else {
      return Row(
        children: _getSeparatorContent(size, step),
      );
    }
  }

  List<Padding> _getSeparatorContent(int size, int step) {
    return List.generate(
      size,
      (index) => Padding(
        padding: widget.vertical != null && widget.vertical!
            ? const EdgeInsets.only(bottom: 4)
            : const EdgeInsets.only(right: 4),
        child: AnimatedContainer(
          duration:
              CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
          curve: Curves.easeIn,
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: (step + 1) < widget.currentStep
                ? widget.color != null
                    ? widget.color!.withAlpha(_selectedAlpha)
                    : CuReDesign.primaryColor.withAlpha(_selectedAlpha)
                : CuReDesign.useDarkMode
                    ? Colors.grey.shade800
                    : Colors.black12,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  double _getWidth(int index) {
    if (widget.hideNumbers == null || !widget.hideNumbers!) {
      return 22;
    }
    if (widget.currentStep == (index + 1) &&
        (widget.vertical == null || !widget.vertical!)) {
      return 42;
    } else {
      return 12;
    }
  }

  double _getHeight(int index) {
    if (widget.hideNumbers == null || !widget.hideNumbers!) {
      return 22;
    } else {
      if (widget.vertical != null &&
          widget.vertical! &&
          widget.currentStep == (index + 1)) {
        return 42;
      }
      return 12;
    }
  }

  double _getBorderRadius() {
    if (widget.shape == null || widget.shape == CuReShape.rounded) {
      return 20;
    }
    if (widget.shape == CuReShape.squared) {
      return 0;
    }
    return CuReDesign.borderRadius;
  }

  Color _getColor(int index) {
    Color baseColor = CuReDesign.primaryColor;
    if (widget.color != null) {
      baseColor = widget.color!;
    }
    if (widget.disabled != null && widget.disabled!) {
      if (CuReDesign.useDarkMode) {
        return CuReUtils.darken(CuReDesign.disabledColor, 0.5);
      } else {
        return CuReDesign.disabledColor;
      }
    }
    if (widget.hideSeparators == null || !widget.hideSeparators!) {
      if ((index + 1) < widget.currentStep) {
        return baseColor.withAlpha(_selectedAlpha);
      } else if ((index + 1) == widget.currentStep) {
        return baseColor;
      } else {
        if (CuReDesign.useDarkMode) {
          return Colors.grey.shade900;
        }
        return Colors.black12;
      }
    }
    if (widget.currentStep == (index + 1)) {
      return CuReDesign.primaryColor;
    }
    if (CuReDesign.useDarkMode) {
      return Colors.grey.shade900;
    }
    return Colors.black12;
  }

  void _goToStep(int step) {
    if (widget.onStepChange != null &&
        (widget.disabled == null || !widget.disabled!) &&
        (widget.readonly == null || !widget.readonly!)) {
      widget.onStepChange!(step + 1);
    }
  }
}
