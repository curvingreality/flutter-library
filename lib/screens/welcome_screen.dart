import 'package:animate_do/animate_do.dart';
import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:flutter/material.dart';

class CuReWelcomeScreen extends StatefulWidget {
  const CuReWelcomeScreen({
    super.key,
    required this.sections,
    this.finishButtonLabel,
    this.onFinish,
    this.logo,
    this.background,
  });

  final List<CuReWelcomeScreenSection> sections;
  final String? finishButtonLabel;
  final Function? onFinish;
  final Widget? logo;
  final Image? background;

  @override
  State<CuReWelcomeScreen> createState() => _CuReWelcomeScreenState();
}

class _CuReWelcomeScreenState extends State<CuReWelcomeScreen> {
  int _currentPage = 0;
  late final PageController _pageViewController = PageController();

  void nextStep() {
    if (_currentPage < widget.sections.length - 1) {
      _pageViewController.animateToPage(
        _currentPage + 1,
        duration: CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
        curve: Curves.easeInOut,
      );
      _updateCurrentPage(_currentPage++);
    } else {
      if (widget.onFinish != null) {
        widget.onFinish!();
      }
    }
  }

  void previousStep() {
    int goToPage = _currentPage - 1;
    if (_currentPage == 0) {
      goToPage = widget.sections.length - 1;
    }
    _pageViewController.animateToPage(
      goToPage,
      duration: CuReDesign.animationDurations[CuReAnimationDuration.medium]!,
      curve: Curves.easeInOut,
    );
    _updateCurrentPage(goToPage);
  }

  void goToStep(int newStep) {
    _pageViewController.jumpToPage(
      newStep,
    );
    _updateCurrentPage(newStep);
  }

  void _updateCurrentPage(int step) {
    setState(() {
      _currentPage = step;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CuReScaffold(
      body: Stack(
        children: [
          if (widget.background != null)
            Positioned(
              right: 0,
              top: 0,
              child: FadeInDown(
                from: 20,
                duration: CuReDesign
                    .animationDurations[CuReAnimationDuration.medium]!,
                delay: const Duration(milliseconds: 200),
                child: widget.background!,
              ),
            ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: widget.logo != null
                      ? FadeIn(
                          duration: CuReDesign.animationDurations[
                              CuReAnimationDuration.medium]!,
                          child: SizedBox(
                            height: 70,
                            child: widget.logo!,
                          ),
                        )
                      : null,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.69 -
                      (widget.logo != null ? 32 : 0),
                  child: Stack(
                    children: [
                      PageView(
                        onPageChanged: _updateCurrentPage,
                        controller: _pageViewController,
                        children: List.generate(
                          widget.sections.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                FadeInUp(
                                  from: 20,
                                  duration: CuReDesign.animationDurations[
                                      CuReAnimationDuration.medium]!,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.39,
                                    child: widget.sections[index].content,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                FadeInRight(
                                  from: 20,
                                  delay: const Duration(milliseconds: 150),
                                  duration: CuReDesign.animationDurations[
                                      CuReAnimationDuration.fast]!,
                                  child: Row(
                                    children: [
                                      CuReStepper(
                                        totalSteps: widget.sections.length,
                                        currentStep: _currentPage + 1,
                                        onStepChange: (int step) {
                                          goToStep(step - 1);
                                        },
                                        hideNumbers: true,
                                        hideSeparators: true,
                                      ),
                                    ],
                                  ),
                                ),
                                CuReSpacing.vertical(),
                                FadeInUp(
                                  from: 20,
                                  delay: const Duration(milliseconds: 250),
                                  duration: CuReDesign.animationDurations[
                                      CuReAnimationDuration.fast]!,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: CuReHeading(
                                      widget.sections[index].title,
                                      align: TextAlign.start,
                                      maxLines: 2,
                                      size: 36,
                                      lineHeight: 1.2,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FadeInUp(
                                  from: 20,
                                  delay: const Duration(milliseconds: 350),
                                  duration: CuReDesign.animationDurations[
                                      CuReAnimationDuration.fast]!,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: CuReText(
                                      widget.sections[index].description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CuReSpacing.vertical(),
                CuReSpacing.vertical(),
                FadeIn(
                  duration: CuReDesign
                      .animationDurations[CuReAnimationDuration.medium]!,
                  delay: const Duration(milliseconds: 450),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: MediaQuery.of(context).padding.bottom > 0
                            ? 20
                            : 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CuReButton(
                          type: CuReButtonType.outlined,
                          icon: _currentPage > 0 ? CuReIcons.arrowBack : null,
                          label: _currentPage == 0
                              ? Localization.getValue('skip')
                              : Localization.getValue('back'),
                          onPressed: () => previousStep(),
                          minSize: Size(
                              MediaQuery.of(context).size.width * 0.45, 45),
                        ),
                        CuReButton(
                          icon: CuReIcons.arrowForward,
                          iconPosition: CuReIconPosition.suffix,
                          label: _currentPage < widget.sections.length - 1
                              ? Localization.getValue('next')
                              : widget.finishButtonLabel ??
                                  Localization.getValue('finish'),
                          onPressed: () => nextStep(),
                          minSize: Size(
                              MediaQuery.of(context).size.width * 0.45, 45),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
