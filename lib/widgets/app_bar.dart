import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuReAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  const CuReAppBar({super.key, this.title, this.titleChild, this.actions});

  final String? title;
  final Widget? titleChild;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    if (CuReUtils.isIos()) {
      return CupertinoNavigationBar(
        backgroundColor: CuReDesign.useDarkMode
            ? CuReDesign.blackColor
            : CuReDesign.whiteColor,
        middle: _getTitle(),
        trailing: actions,
      );
    } else {
      return AppBar(
        backgroundColor: CuReDesign.useDarkMode
            ? CuReDesign.blackColor
            : CuReDesign.whiteColor,
        title: _getTitle(),
        actions: actions != null ? [actions!] : null,
        foregroundColor: CuReDesign.useDarkMode ? CuReDesign.whiteColor : null,
      );
    }
  }

  Widget? _getTitle() {
    if (title != null) {
      return CuReText(
        title!,
        weight: FontWeight.w600,
      );
    } else if (titleChild != null) {
      return titleChild;
    } else {
      return null;
    }
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    throw UnimplementedError();
  }
}
