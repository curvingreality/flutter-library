import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';

class CuReIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;

  const CuReIcon(this.icon, {super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Icon(
        icon,
        key: ValueKey(icon.toString() +
            (color?.toString().toString() ?? '') +
            (size?.toString() ?? '')),
        color: _getColor(),
        size: size ?? 24,
      ),
    );
  }

  Color _getColor() {
    if (color != null) {
      return color!;
    }
    if (CuReDesign.useDarkMode) {
      return CuReDesign.whiteColor;
    }
    return CuReDesign.primaryColor;
  }
}
