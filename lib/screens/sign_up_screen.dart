import 'package:animate_do/animate_do.dart';
import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CuReSignUpScreen extends StatefulWidget {
  const CuReSignUpScreen({
    super.key,
    this.title,
    this.description,
    this.content,
    this.logo,
    this.thirdPartAuthTypes,
    this.onThirdPartSignUp,
    required this.onSignUp,
    required this.onSignIn,
    this.termsOfServiceUrl,
    this.privacyPolicyUrl,
    this.signUpEnabled,
    this.isCreating,
    this.emailNotConfirmed,
    this.onEmailVerificationResend,
    this.onSignInAgain,
    this.background,
  });

  final String? title;
  final String? description;
  final Widget? content;
  final Widget? logo;
  final List<CuReAuthType>? thirdPartAuthTypes;
  final Function(CuReAuthType)? onThirdPartSignUp;
  final Function onSignUp;
  final Function onSignIn;
  final String? termsOfServiceUrl;
  final String? privacyPolicyUrl;
  final bool? signUpEnabled;
  final bool? isCreating;
  final bool? emailNotConfirmed;
  final Function? onEmailVerificationResend;
  final Function? onSignInAgain;
  final Image? background;

  @override
  State<CuReSignUpScreen> createState() => _CuReSignUpScreenState();
}

class _CuReSignUpScreenState extends State<CuReSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;

  TextStyle agreementsTextStyle =
      const TextStyle(color: Colors.black, fontSize: 14, height: 1.5);

  @override
  Widget build(BuildContext context) {
    return CuReScaffold(
      resizeToAvoidBottomInset: true,
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
        SafeArea(
          child: SingleChildScrollView(
            child: widget.emailNotConfirmed == null ||
                    !widget.emailNotConfirmed!
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        if (widget.logo != null) ...[
                          FadeInUp(
                            from: 20,
                            duration: CuReDesign.animationDurations[
                                CuReAnimationDuration.medium]!,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: widget.logo!,
                            ),
                          ),
                        ],
                        const SizedBox(width: 35),
                        CuReSpacing.vertical(),
                        FadeInUp(
                          from: 20,
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          delay: const Duration(milliseconds: 200),
                          child: Column(
                            children: [
                              CuReHeading(
                                widget.title ??
                                    Localization.getValue('create_an_account'),
                              ),
                              CuReText(
                                widget.description ??
                                    Localization.getValue(
                                        'create_an_account_description'),
                                lineHeight: 0,
                              ),
                            ],
                          ),
                        ),
                        CuReSpacing.vertical(2.5),
                        Column(
                          children: [
                            FadeInUp(
                              from: 20,
                              duration: CuReDesign.animationDurations[
                                  CuReAnimationDuration.medium]!,
                              delay: const Duration(milliseconds: 300),
                              child: Column(children: [
                                CuReTextField(
                                  disabled: _isCreating(),
                                  controller: _emailController,
                                  onValidation: (value) {
                                    setState(() {
                                      isEmailValid = value;
                                    });
                                  },
                                  type: CuReTextFieldType.email,
                                  label: Localization.getValue('email_address'),
                                  placeholder: Localization.getValue(
                                      'email_address_placeholder'),
                                  validator: CuReTextFieldValidator(
                                    required: true,
                                  ),
                                ),
                                CuReSpacing.vertical(),
                                CuReTextField(
                                  disabled: _isCreating(),
                                  controller: _passwordController,
                                  onValidation: (value) {
                                    setState(() {
                                      isPasswordValid = value;
                                    });
                                  },
                                  type: CuReTextFieldType.password,
                                  label: Localization.getValue('password'),
                                  placeholder: Localization.getValue(
                                      'password_placeholder'),
                                  validator: CuReTextFieldValidator(
                                    required: true,
                                    securePassword: true,
                                  ),
                                ),
                                if (widget.content != null) ...[
                                  CuReSpacing.vertical(),
                                  widget.content!,
                                ],
                                CuReSpacing.vertical(),
                                CuReButton(
                                  label: Localization.getValue('sign_up'),
                                  disabled: _isCreating() ||
                                      _emailController.text.isEmpty ||
                                      _passwordController.text.isEmpty ||
                                      !isEmailValid ||
                                      !isPasswordValid ||
                                      (widget.signUpEnabled != null &&
                                          !widget.signUpEnabled!),
                                  minSize: const Size(double.infinity, 50),
                                  isLoading: _isCreating(),
                                  onPressed: () {
                                    widget.onSignUp({
                                      'email': _emailController.text,
                                      'password': _passwordController.text,
                                    });
                                  },
                                ),
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
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
                              ),
                            if (widget.thirdPartAuthTypes != null &&
                                widget.thirdPartAuthTypes!
                                    .contains(CuReAuthType.google))
                              FadeInUp(
                                from: 20,
                                duration: CuReDesign.animationDurations[
                                    CuReAnimationDuration.medium]!,
                                delay: const Duration(milliseconds: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: CuReButton(
                                    minSize: const Size(double.infinity, 50),
                                    customPrefix: const Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: FaIcon(
                                        FontAwesomeIcons.google,
                                        size: 18,
                                      ),
                                    ),
                                    disabled: _isCreating(),
                                    type: CuReButtonType.outlined,
                                    label: Localization.getValue(
                                        'continue_with_google'),
                                    onPressed: () {
                                      _onThirdPartSignUp(CuReAuthType.google);
                                    },
                                  ),
                                ),
                              ),
                            if (widget.thirdPartAuthTypes != null &&
                                widget.thirdPartAuthTypes!
                                    .contains(CuReAuthType.apple))
                              FadeInUp(
                                  from: 20,
                                  duration: CuReDesign.animationDurations[
                                      CuReAnimationDuration.medium]!,
                                  delay: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: CuReButton(
                                      minSize: const Size(double.infinity, 50),
                                      customPrefix: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
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
                                      disabled: _isCreating(),
                                      type: CuReButtonType.outlined,
                                      label: Localization.getValue(
                                          'continue_with_apple'),
                                      onPressed: () {
                                        _onThirdPartSignUp(CuReAuthType.apple);
                                      },
                                    ),
                                  )),
                            if (widget.thirdPartAuthTypes != null &&
                                widget.thirdPartAuthTypes!
                                    .contains(CuReAuthType.facebook))
                              FadeInUp(
                                  from: 20,
                                  duration: CuReDesign.animationDurations[
                                      CuReAnimationDuration.medium]!,
                                  delay: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: CuReButton(
                                      minSize: const Size(double.infinity, 50),
                                      customPrefix: const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: FaIcon(
                                          FontAwesomeIcons.facebook,
                                          size: 20,
                                          color: Color(0xFF3B5998),
                                        ),
                                      ),
                                      disabled: _isCreating(),
                                      type: CuReButtonType.outlined,
                                      label: Localization.getValue(
                                          'continue_with_facebook'),
                                      color: const Color(0xFF3B5998),
                                      onPressed: () {
                                        _onThirdPartSignUp(
                                            CuReAuthType.facebook);
                                      },
                                    ),
                                  )),
                            if (widget.thirdPartAuthTypes != null &&
                                widget.thirdPartAuthTypes!
                                    .contains(CuReAuthType.linkedin))
                              FadeInUp(
                                  from: 20,
                                  duration: CuReDesign.animationDurations[
                                      CuReAnimationDuration.medium]!,
                                  delay: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: CuReButton(
                                      minSize: const Size(double.infinity, 50),
                                      customPrefix: const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: FaIcon(
                                          FontAwesomeIcons.linkedin,
                                          size: 20,
                                          color: Color(0xFF0077B5),
                                        ),
                                      ),
                                      disabled: _isCreating(),
                                      type: CuReButtonType.outlined,
                                      label: Localization.getValue(
                                          'continue_with_linkedin'),
                                      color: const Color(0xFF0077B5),
                                      onPressed: () {
                                        _onThirdPartSignUp(
                                            CuReAuthType.linkedin);
                                      },
                                    ),
                                  )),
                            if (widget.termsOfServiceUrl != null &&
                                widget.privacyPolicyUrl != null)
                              FadeInUp(
                                from: 20,
                                duration: CuReDesign.animationDurations[
                                    CuReAnimationDuration.medium]!,
                                delay: const Duration(milliseconds: 600),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 6,
                                  ),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: CuReLocalization.get(
                                              'by_signing_up'),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: CuReLink(
                                            label: CuReLocalization.get(
                                                'privacy_policy'),
                                            url: widget.privacyPolicyUrl,
                                            openInExternalBrowser: true,
                                            size: 12,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 2,
                                              vertical: 2,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: CuReLocalization.get('and_our'),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: CuReLink(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 2,
                                              vertical: 2,
                                            ),
                                            label: CuReLocalization.get(
                                                'terms_of_service'),
                                            url: widget.termsOfServiceUrl,
                                            openInExternalBrowser: true,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            FadeInLeft(
                              from: 20,
                              delay: const Duration(milliseconds: 400),
                              duration: CuReDesign.animationDurations[
                                  CuReAnimationDuration.medium]!,
                              child: CuReDivider(
                                color: Colors.grey.shade300,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 26,
                                ),
                              ),
                            ),
                            FadeInUp(
                                from: 20,
                                delay: const Duration(milliseconds: 600),
                                duration: CuReDesign.animationDurations[
                                    CuReAnimationDuration.medium]!,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CuReText(
                                      Localization.getValue(
                                          'already_have_account'),
                                    ),
                                    CuReSpacing.vertical(0.8),
                                    CuReButton(
                                      type: CuReButtonType.outlined,
                                      disabled: _isCreating(),
                                      label: Localization.getValue('sign_in'),
                                      size: CuReButtonSize.small,
                                      onPressed: () {
                                        widget.onSignIn();
                                      },
                                    ),
                                    CuReSpacing.vertical(2),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                : _emailNotConfirmedWidget(),
          ),
        ),
      ]),
    );
  }

  Widget _emailNotConfirmedWidget() {
    return Center(
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
              duration:
                  CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: widget.logo!,
                ),
              ),
            )
          ],
          CuReSpacing.vertical(4),
          FadeInUp(
            from: 20,
            duration:
                CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
            delay: const Duration(milliseconds: 200),
            child: Icon(
              CuReIcons.mail,
              size: 55,
              color: CuReDesign.primaryColor,
            ),
          ),
          CuReSpacing.vertical(),
          FadeInUp(
            from: 20,
            duration:
                CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
            delay: const Duration(milliseconds: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CuReHeading(
                  Localization.getValue('email_not_confirmed_error'),
                  align: TextAlign.center,
                  size: 18,
                ),
                CuReSpacing.vertical(0.7),
                CuReText(
                  Localization.getValue('check_your_email_spam'),
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
          CuReSpacing.vertical(2),
          FadeInUp(
            from: 20,
            duration:
                CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
            delay: const Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CuReButton(
                    label: Localization.getValue('resend_confirmation_email'),
                    minSize: const Size(double.infinity, 50),
                    isLoading: _isCreating(),
                    onPressed: () {
                      if (widget.onEmailVerificationResend != null) {
                        widget.onEmailVerificationResend!();
                      }
                    },
                  ),
                  CuReSpacing.vertical(0.6),
                  CuReButton(
                    label: Localization.getValue('sign_in'),
                    minSize: const Size(double.infinity, 50),
                    type: CuReButtonType.outlined,
                    disabled: _isCreating(),
                    onPressed: () {
                      if (widget.onSignInAgain != null) {
                        widget.onSignInAgain!();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  bool _isCreating() {
    return widget.isCreating != null && widget.isCreating!;
  }

  void _onThirdPartSignUp(CuReAuthType type) {
    if (widget.onThirdPartSignUp != null) {
      widget.onThirdPartSignUp!(type);
    }
  }
}
