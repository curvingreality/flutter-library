import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReSettingsGroup extends StatelessWidget {
  const CuReSettingsGroup(
      {super.key, this.title, required this.items, this.titleChild});

  final String? title;
  final Widget? titleChild;
  final List<CuReSettingsItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CuReText(title!, size: 12),
                titleChild ?? const SizedBox(),
              ],
            ),
          ),
        Container(
          padding: const EdgeInsets.only(
            left: 7,
            right: 7,
            top: 3,
            bottom: 3,
          ),
          decoration: BoxDecoration(
            color: CuReDesign.useDarkMode
                ? Colors.grey.shade900
                : Colors.grey.shade100,
            border: Border.all(
              color: CuReDesign.useDarkMode
                  ? Colors.grey.shade800
                  : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(CuReDesign.borderRadius),
          ),
          child: Column(
            children: items
                .asMap()
                .map((i, item) => MapEntry(
                    i,
                    Column(
                      children: [
                        Material(
                          borderRadius: Utils.getBorderRadius(
                              CuReDesign.defaultElementsShape),
                          color: Colors.transparent,
                          child: InkWell(
                            splashFactory: Utils.getSplashFactory(),
                            borderRadius: Utils.getBorderRadius(
                                CuReDesign.defaultElementsShape),
                            onTap: item.onTap,
                            child: Ink(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        item.icon != null
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color:
                                                      CuReDesign.useDarkMode ||
                                                              item.color != null
                                                          ? _getColor(item)
                                                              .withAlpha(30)
                                                          : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Icon(item.icon,
                                                    color: _getColor(item)),
                                              )
                                            : const SizedBox(),
                                        item.iconChild != null
                                            ? item.iconChild!
                                            : const SizedBox(),
                                        const SizedBox(width: 10),
                                        item.description != null
                                            ? CuReText(
                                                item.description!,
                                                color: item.color,
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    item.child
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (i < items.length - 1)
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: CuReDivider(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              color: CuReDesign.useDarkMode
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade300,
                            ),
                          ),
                      ],
                    )))
                .values
                .toList(),
          ),
        ),
      ],
    );
  }

  Color _getColor(CuReSettingsItem item) {
    if (item.color != null) {
      return item.color!;
    }
    if (CuReDesign.useDarkMode) {
      return Colors.white;
    }
    return CuReDesign.textColor;
  }
}
