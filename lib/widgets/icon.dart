import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';

class CuReIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;

  const CuReIcon(this.icon, {super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: _getColor(),
      size: size ?? 24,
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
