import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReLink extends StatelessWidget {
  const CuReLink({
    super.key,
    required this.label,
    this.url,
    this.openInExternalBrowser,
    this.color,
    this.onPressed,
    this.padding,
    this.size,
  });

  final String label;
  final String? url;
  final bool? openInExternalBrowser;
  final Color? color;
  final Function? onPressed;
  final EdgeInsets? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (onPressed != null) {
          onPressed!();
        }
        if (url != null) {
          await CuReUtils.openUrl(
            url!,
            openInExternalBrowser ?? false,
          );
        }
      },
      highlightColor: color != null
          ? color!.withAlpha(30)
          : CuReDesign.primaryColor.withAlpha(30),
      splashFactory: Utils.getSplashFactory(),
      borderRadius: Utils.getBorderRadius(CuReDesign.defaultElementsShape),
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: CuReDesign.spacing,
              vertical: CuReDesign.spacing / 2,
            ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: color ?? CuReDesign.primaryColor.withAlpha(200),
                width: 1,
              ),
            ),
          ),
          child: CuReText(
            label,
            color: color ?? CuReDesign.primaryColor.withAlpha(200),
            size: size,
          ),
        ),
      ),
    );
  }
}
