library curving_reality_kit;

import 'dart:async';
import 'dart:io';
import 'package:curving_reality_library/design.dart';
import 'package:curving_reality_library/enums/button.dart';
import 'package:curving_reality_library/icons.dart';
import 'package:curving_reality_library/services/localization.dart';
import 'package:curving_reality_library/models/dialog.dart';
import 'package:curving_reality_library/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';

// Widgets exports
export './widgets/button.dart';
export './widgets/checkbox.dart';
export './widgets/text.dart';
export 'widgets/heading.dart';
export './widgets/radio.dart';
export './widgets/switch.dart';
export './widgets/divider.dart';
export './widgets/app_bar.dart';
export './widgets/text_field.dart';
export 'widgets/info.dart';
export 'widgets/expandable.dart';
export 'widgets/progress_bar.dart';
export 'widgets/badge.dart';
export 'widgets/circular_progress_indicator.dart';
export 'widgets/avatar.dart';
export 'widgets/stepper.dart';
export 'widgets/link.dart';
export 'widgets/chip_choice.dart';
export 'widgets/dropdown.dart';
export 'widgets/rating.dart';
export 'widgets/selectable_card.dart';
export 'widgets/scaffold.dart';
export 'widgets/toggle_buttons.dart';
export 'widgets/slider.dart';
export 'widgets/settings_group.dart';
export 'widgets/circular_progres_bar.dart';
export 'widgets/icon_picker.dart';
export 'widgets/color_picker.dart';
export 'widgets/empty_state.dart';
export 'widgets/picker.dart';
export 'widgets/icon.dart';

// Enums exports
export './enums/button.dart';
export './enums/text_field_type.dart';
export './enums/info.dart';
export './enums/progress_indicator.dart';
export './enums/avatar.dart';
export './enums/general.dart';
export './enums/auth.dart';

// Models exports
export './models/text_field_validator.dart';
export './models/welcome_screen.dart';
export './models/chip_choice.dart';
export './models/dropdown.dart';
export './models/login.dart';
export './models/dialog.dart';
export './models/toggle_buttons.dart';
export './models/settings_item.dart';
export './models/local_notification.dart';

// Services exports
export './services/storage.dart';
export './services/supabase.dart';
export './services/localization.dart';

// Other
export './design.dart';
export './icons.dart';

class CuReUtils {
  static dynamicWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  static dynamicHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  static bool isIos() {
    try {
      return Platform.isIOS || Platform.isMacOS;
    } catch (e) {
      return false;
    }
  }

  static void navigateTo(BuildContext context, Widget screen) {
    if (CuReUtils.isIos()) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => screen,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );
    }
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateReplace(BuildContext context, Widget screen) {
    if (CuReUtils.isIos()) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => screen,
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );
    }
  }

  static dynamic darkModeWrapper(dynamic whiteMode, dynamic darkMode) {
    return CuReDesign.useDarkMode ? darkMode : whiteMode;
  }

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static Future<void> openUrl(String url, bool useExternalBrowser) async {
    final Uri urlFinal = Uri.parse(url);
    if (!await launchUrl(
      urlFinal,
      mode: useExternalBrowser
          ? LaunchMode.externalApplication
          : LaunchMode.platformDefault,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  static isSystemDarkModeActive() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  static void openDialog(
      {required BuildContext context,
      Widget content = const SizedBox(),
      String title = '',
      List<CuReDialogAction> actions = const []}) {
    if (isIos()) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: title != '' ? Text(title) : null,
              content: content,
              actions: actions.isNotEmpty
                  ? [
                      for (var action in actions)
                        CupertinoDialogAction(
                          child: Text(
                            action.label,
                            style: TextStyle(
                              fontSize: 14,
                              color: action.color ?? CuReDesign.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            if (action.onPressed != null) action.onPressed!();
                          },
                        ),
                    ]
                  : [
                      CupertinoDialogAction(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                            fontSize: 14,
                            color: CuReDesign.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
            );
          });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title != '' ? Text(title) : null,
            content: content,
            actions: actions.isNotEmpty
                ? [
                    for (var action in actions)
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (action.onPressed != null) action.onPressed!();
                        },
                        child: Text(
                          action.label,
                          style: TextStyle(
                            color: action.color ?? CuReDesign.primaryColor,
                          ),
                        ),
                      ),
                  ]
                : [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: CuReDesign.primaryColor,
                        ),
                      ),
                    ),
                  ],
          );
        },
      );
    }
  }

  static Future<T?> openBottomSheet<T>({
    required BuildContext context,
    WidgetBuilder? contentBuilder,
    Widget? content,
    String title = '',
    List<CuReDialogAction> actions = const [],
    bool? hideCloseButton = false,
    bool useIsolatedNavigator = false, // 👈 flag per Navigator separato
  }) {
    assert(contentBuilder != null || content != null,
        'You must provide either contentBuilder or content.');

    final Widget builtContent = contentBuilder != null
        ? contentBuilder(context)
        : (content ?? const SizedBox());

    if (isIos()) {
      return showCupertinoModalPopup<T>(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            message: Stack(
              children: [
                if (hideCloseButton == null || !hideCloseButton)
                  CuReSpacing.vertical(0.5),
                Padding(
                    padding: EdgeInsets.only(
                      top: hideCloseButton == null || hideCloseButton ? 5 : 30,
                    ),
                    child: builtContent),
                if (hideCloseButton == null || !hideCloseButton)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CuReButton(
                      type: CuReButtonType.text,
                      icon: CuReIcons.close,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
              ],
            ),
            title: title != '' ? Text(title) : null,
            actions: actions
                .map((action) => CupertinoActionSheetAction(
                      child: Text(
                        action.label,
                        style: TextStyle(
                          fontSize: 14,
                          color: CuReDesign.primaryColor,
                        ),
                      ),
                      onPressed: () {
                        if (action.onPressed != null) action.onPressed!();
                        Navigator.of(context).pop();
                      },
                    ))
                .toList(),
          );
        },
      );
    } else {
      return showModalBottomSheet<T>(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          final child = Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != '') ...[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                builtContent,
                const SizedBox(height: 20),
                if (actions.isNotEmpty) ...[
                  for (var action in actions)
                    TextButton(
                      onPressed: () {
                        if (action.onPressed != null) action.onPressed!();
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        action.label,
                        style: TextStyle(
                          color: CuReDesign.primaryColor,
                        ),
                      ),
                    ),
                ],
              ],
            ),
          );

          if (useIsolatedNavigator) {
            return Navigator(
              onGenerateRoute: (_) => MaterialPageRoute(
                builder: (_) => child,
              ),
            );
          }

          return child;
        },
      );
    }
  }

  static String fromIconToString(IconData icon) {
    return '${icon.codePoint}|${icon.fontFamily ?? ''}|${icon.fontPackage ?? ''}|${icon.matchTextDirection}';
  }

  static IconData fromStringToIcon(String input) {
    final parts = input.split('|');
    if (parts.length != 4) {
      throw FormatException("Invalid IconData string: $input");
    }

    final codePointStr = parts[0];
    final codePoint = codePointStr.startsWith('0x')
        ? int.parse(codePointStr.substring(2), radix: 16)
        : int.parse(codePointStr); // fallback per decimali

    return IconData(
      codePoint,
      fontFamily: parts[1].isEmpty ? null : parts[1],
      fontPackage: parts[2].isEmpty ? null : parts[2],
      matchTextDirection: parts[3] == 'true',
    );
  }

  static List<String> getMonthsNames() {
    return [
      Localization.getValue('january'),
      Localization.getValue('february'),
      Localization.getValue('march'),
      Localization.getValue('april'),
      Localization.getValue('may'),
      Localization.getValue('june'),
      Localization.getValue('july'),
      Localization.getValue('august'),
      Localization.getValue('september'),
      Localization.getValue('october'),
      Localization.getValue('november'),
      Localization.getValue('december'),
    ];
  }

  static List<String> getWeekDaysNames() {
    return [
      Localization.getValue('sunday'),
      Localization.getValue('monday'),
      Localization.getValue('tuesday'),
      Localization.getValue('wednesday'),
      Localization.getValue('thursday'),
      Localization.getValue('friday'),
      Localization.getValue('saturday'),
    ];
  }

  static RichText parseHtml(String htmlText, double? fontSize) {
    final List<TextSpan> spans = [];

    final regex = RegExp(r'(<b>(.*?)<\/b>)|([^<]+)', caseSensitive: false);

    final matches = regex.allMatches(htmlText);

    for (final match in matches) {
      if (match.group(1) != null) {
        // testo in <b>
        spans.add(
          TextSpan(
            text: match.group(2),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      } else if (match.group(3) != null) {
        // testo normale
        spans.add(
          TextSpan(
            text: match.group(3),
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        );
      }
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: spans,
        style: TextStyle(
          color: CuReDesign.textColor,
          fontSize: fontSize ?? 16,
          height: 1.5,
        ),
      ),
    );
  }
}

class CuReSpacing {
  static Widget vertical([double? multiplier]) {
    double size = multiplier ?? 1;
    return SizedBox(height: CuReDesign.spacing * (size * 2));
  }

  static Widget horizontal([double? multiplier]) {
    double size = multiplier ?? 1;
    return SizedBox(width: CuReDesign.spacing * (size * 2));
  }
}

class CuReDebouncer {
  final int milliseconds;
  Timer? _timer;

  CuReDebouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
