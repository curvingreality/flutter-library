import 'package:animate_do/animate_do.dart';
import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CuReSignInScreen extends StatefulWidget {
  const CuReSignInScreen({
    super.key,
    required this.onSignIn,
    this.logo,
    this.onThirdPartSignIn,
    this.onSignUp,
    this.thirdPartAuthTypes,
    this.onForgotPassword,
    this.background,
    this.isLoading,
  });

  final Widget? logo;
  final Function(CuReAuthType)? onThirdPartSignIn;
  final Function(CuReSignInPayload) onSignIn;
  final Function? onSignUp;
  final List<CuReAuthType>? thirdPartAuthTypes;
  final Function? onForgotPassword;
  final Image? background;
  final bool? isLoading;

  @override
  State<CuReSignInScreen> createState() => _CuReSignInScreenState();
}

class _CuReSignInScreenState extends State<CuReSignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSignInButtonEnabled = false;

  void _checkSignInButtonEnabled() {
    setState(() {
      isSignInButtonEnabled = emailController.text.trim() != '' &&
          passwordController.text.trim() != '' &&
          CuReUtils.isEmailValid(
            emailController.text,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CuReScaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          if (widget.background != null)
            Positioned(
              top: 0,
              right: 0,
              child: FadeInDown(
                from: 20,
                duration: CuReDesign
                    .animationDurations[CuReAnimationDuration.medium]!,
                delay: const Duration(milliseconds: 200),
                child: widget.background!,
              ),
            ),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 70,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                        from: 20,
                        delay: const Duration(milliseconds: 200),
                        duration: CuReDesign
                            .animationDurations[CuReAnimationDuration.medium]!,
                        child: Column(children: [
                          if (widget.logo != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: widget.logo!,
                            ),
                          CuReText(
                            Localization.getValue('sign_in'),
                            align: TextAlign.center,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      FadeInUp(
                        from: 20,
                        delay: const Duration(milliseconds: 400),
                        duration: CuReDesign
                            .animationDurations[CuReAnimationDuration.medium]!,
                        child: Column(children: [
                          CuReTextField(
                            placeholder: Localization.getValue('email_address'),
                            controller: emailController,
                            prefixIcon: Icons.email,
                            onChanged: (value) => _checkSignInButtonEnabled(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CuReTextField(
                            placeholder: Localization.getValue('password'),
                            type: CuReTextFieldType.password,
                            controller: passwordController,
                            prefixIcon: Icons.password,
                            onChanged: (value) => _checkSignInButtonEnabled(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CuReButton(
                            minSize: const Size(double.infinity, 50),
                            isLoading: widget.isLoading ?? false,
                            label: Localization.getValue('sign_in'),
                            onPressed: isSignInButtonEnabled
                                ? () => widget.onSignIn(
                                      CuReSignInPayload(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    )
                                : null,
                          ),
                          CuReSpacing.vertical(),
                          CuReLink(
                              label: Localization.getValue('forgot_password'),
                              onPressed: () {
                                if (widget.onForgotPassword != null) {
                                  widget.onForgotPassword!();
                                }
                              }),
                        ]),
                      ),
                      if (widget.thirdPartAuthTypes != null &&
                          widget.thirdPartAuthTypes!.isNotEmpty)
                        FadeInLeft(
                          from: 20,
                          delay: const Duration(milliseconds: 400),
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          child: CuReDivider(
                            label: Localization.getValue('or'),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      if (widget.thirdPartAuthTypes != null &&
                          widget.thirdPartAuthTypes!
                              .contains(CuReAuthType.google))
                        FadeInUp(
                          from: 20,
                          delay: const Duration(milliseconds: 600),
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CuReButton(
                              minSize: const Size(double.infinity, 50),
                              disabled: widget.isLoading ?? false,
                              customPrefix: const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: FaIcon(
                                  FontAwesomeIcons.google,
                                  size: 18,
                                ),
                              ),
                              type: CuReButtonType.outlined,
                              label:
                                  Localization.getValue('continue_with_google'),
                              onPressed: () {
                                _onThirdPartSignIn(CuReAuthType.google);
                              },
                            ),
                          ),
                        ),
                      if (widget.thirdPartAuthTypes != null &&
                          widget.thirdPartAuthTypes!
                              .contains(CuReAuthType.apple))
                        FadeInUp(
                          from: 20,
                          delay: const Duration(milliseconds: 600),
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CuReButton(
                              minSize: const Size(double.infinity, 50),
                              disabled: widget.isLoading ?? false,
                              customPrefix: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: FaIcon(
                                  FontAwesomeIcons.apple,
                                  size: 20,
                                  color: CuReDesign.useDarkMode
                                      ? CuReDesign.whiteColor
                                      : CuReDesign.blackColor,
                                ),
                              ),
                              color: CuReDesign.useDarkMode
                                  ? CuReDesign.whiteColor
                                  : CuReDesign.blackColor,
                              type: CuReButtonType.outlined,
                              label:
                                  Localization.getValue('continue_with_apple'),
                              onPressed: () {
                                _onThirdPartSignIn(CuReAuthType.apple);
                              },
                            ),
                          ),
                        ),
                      if (widget.thirdPartAuthTypes != null &&
                          widget.thirdPartAuthTypes!
                              .contains(CuReAuthType.facebook))
                        FadeInUp(
                          from: 20,
                          delay: const Duration(milliseconds: 600),
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CuReButton(
                              minSize: const Size(double.infinity, 50),
                              disabled: widget.isLoading ?? false,
                              customPrefix: const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  size: 20,
                                  color: Color(0xFF3B5998),
                                ),
                              ),
                              type: CuReButtonType.outlined,
                              label: Localization.getValue(
                                  'continue_with_facebook'),
                              color: const Color(0xFF3B5998),
                              onPressed: () {
                                _onThirdPartSignIn(CuReAuthType.facebook);
                              },
                            ),
                          ),
                        ),
                      if (widget.thirdPartAuthTypes != null &&
                          widget.thirdPartAuthTypes!
                              .contains(CuReAuthType.linkedin))
                        FadeInUp(
                          from: 20,
                          delay: const Duration(milliseconds: 600),
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: CuReButton(
                              minSize: const Size(double.infinity, 50),
                              disabled: widget.isLoading ?? false,
                              customPrefix: const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: FaIcon(
                                  FontAwesomeIcons.linkedin,
                                  size: 20,
                                  color: Color(0xFF0077B5),
                                ),
                              ),
                              type: CuReButtonType.outlined,
                              label: Localization.getValue(
                                  'continue_with_linkedin'),
                              color: const Color(0xFF0077B5),
                              onPressed: () {
                                _onThirdPartSignIn(CuReAuthType.linkedin);
                              },
                            ),
                          ),
                        ),
                      CuReSpacing.vertical(),
                      if (widget.onSignUp != null)
                        FadeInUp(
                          from: 20,
                          delay: const Duration(milliseconds: 600),
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.thirdPartAuthTypes == null ||
                                  widget.thirdPartAuthTypes!.isEmpty)
                                const CuReDivider(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 30)),
                              CuReText(
                                Localization.getValue('dont_have_account'),
                              ),
                              CuReSpacing.vertical(0.8),
                              CuReButton(
                                type: CuReButtonType.outlined,
                                size: CuReButtonSize.small,
                                label: Localization.getValue('sign_up'),
                                onPressed: () {
                                  widget.onSignUp!();
                                },
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onThirdPartSignIn(CuReAuthType type) {
    if (widget.onThirdPartSignIn != null) {
      widget.onThirdPartSignIn!(type);
    }
  }
}
