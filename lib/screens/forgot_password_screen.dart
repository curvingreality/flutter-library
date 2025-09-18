import 'package:animate_do/animate_do.dart';
import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:flutter/cupertino.dart';

class CuReForgotPasswordScreen extends StatefulWidget {
  const CuReForgotPasswordScreen(
      {super.key,
      this.logo,
      this.isSending,
      required this.onPasswordResetSend,
      this.background});

  final Image? logo;
  final bool? isSending;
  final Function()? onPasswordResetSend;
  final Image? background;

  @override
  State<CuReForgotPasswordScreen> createState() =>
      _CuReForgotPasswordScreenState();
}

class _CuReForgotPasswordScreenState extends State<CuReForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    bool isEmailValid = false;

    return CuReScaffold(
        body: Stack(children: [
      if (widget.background != null)
        Positioned(
          top: 0,
          right: 0,
          child: FadeInDown(
            from: 20,
            duration:
                CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
            delay: const Duration(milliseconds: 200),
            child: widget.background!,
          ),
        ),
      Positioned(
        left: 20,
        top: MediaQuery.of(context).padding.top + 20,
        child: FadeIn(
          duration:
              CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
          delay: const Duration(milliseconds: 200),
          child: CuReButton(
            icon: CuReIcons.arrowBack,
            type: CuReButtonType.text,
            size: CuReButtonSize.large,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.logo != null) ...[
                  FadeInUp(
                    from: 20,
                    duration: CuReDesign
                        .animationDurations[CuReAnimationDuration.medium]!,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: widget.logo!,
                      ),
                    ),
                  )
                ],
                CuReSpacing.vertical(2),
                FadeInUp(
                  from: 20,
                  duration: CuReDesign
                      .animationDurations[CuReAnimationDuration.medium]!,
                  delay: const Duration(milliseconds: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CuReText(
                        Localization.getValue('forgot_password_email'),
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                CuReSpacing.vertical(2),
                FadeInUp(
                  from: 20,
                  duration: CuReDesign
                      .animationDurations[CuReAnimationDuration.medium]!,
                  delay: const Duration(milliseconds: 400),
                  child: CuReTextField(
                    controller: controller,
                    placeholder: Localization.getValue('email_placeholder'),
                  ),
                ),
                CuReSpacing.vertical(0.6),
                FadeInUp(
                  from: 20,
                  duration: CuReDesign
                      .animationDurations[CuReAnimationDuration.medium]!,
                  delay: const Duration(milliseconds: 500),
                  child: CuReButton(
                    label: Localization.getValue('forgot_password_submit'),
                    minSize: const Size(double.infinity, 50),
                    isLoading: _isSending(),
                    disabled: !isEmailValid,
                    onPressed: () {
                      if (widget.onPasswordResetSend != null) {
                        widget.onPasswordResetSend!();
                      }
                    },
                  ),
                ),
              ],
            ),
          ))),
    ]));
  }

  bool _isSending() {
    return widget.isSending != null && widget.isSending!;
  }
}
