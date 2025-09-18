import 'package:animate_do/animate_do.dart';
import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/enums/animation.dart';
import 'package:curving_reality_library/enums/local_notification.dart';
import 'package:curving_reality_library/models/survey.dart';
import 'package:curving_reality_library/services/notifications.dart';
import 'package:curving_reality_library/utils.dart';
import 'package:flutter/material.dart';

class CuReSurveyScreen extends StatefulWidget {
  const CuReSurveyScreen(
      {super.key,
      required this.questions,
      this.onSkip,
      this.onFinish,
      this.logo});

  final List<CuReSurveyQuestion> questions;
  final Function()? onSkip;
  final Function(Map<int, List<CuReSurveyAnswer>>)? onFinish;
  final String? logo;

  @override
  State<CuReSurveyScreen> createState() => _CuReSurveyScreenState();
}

class _CuReSurveyScreenState extends State<CuReSurveyScreen> {
  int currentStep = 0;
  final Map<int, List<CuReSurveyAnswer>> answers = {};
  bool isGoingPrevious = false;

  @override
  initState() {
    CuReNotifications.key = GlobalKey<CuReScaffoldState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CuReScaffold(
      key: CuReNotifications.key,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: widget.onSkip != null || widget.logo != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.onSkip != null)
                  CuReButton(
                    minSize: const Size(45, 25),
                    onPressed: () {
                      widget.onSkip!();
                    },
                    label: CuReLocalization.get('skip'),
                    size: CuReButtonSize.small,
                    type: CuReButtonType.text,
                  ),
                CuReProgressBar(
                    height: 7,
                    width: MediaQuery.of(context).size.width * 0.44,
                    percentage:
                        (100 * (currentStep + 1)) / widget.questions.length +
                            1),
                if (widget.onSkip != null && widget.logo == null)
                  const SizedBox(width: 45),
                if (widget.logo != null)
                  Image.asset(
                    widget.logo!,
                    height: 45,
                    width: 45,
                  )
              ],
            ),
            CuReSpacing.vertical(),
            FadeInRight(
              from: isGoingPrevious ? -30 : 30,
              key: ValueKey(currentStep),
              duration:
                  CuReDesign.animationDurations[CuReAnimationDuration.fast]!,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CuReHeading(
                  widget.questions[currentStep].question,
                  lineHeight: 1.3,
                  align: TextAlign.center,
                ),
              ),
            ),
            CuReSpacing.vertical(),
            Column(children: [
              ...widget.questions[currentStep].answers
                  .asMap()
                  .map((i, e) => MapEntry(
                      i,
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: FadeInUp(
                            key: ValueKey(e.id + currentStep),
                            from: 10,
                            duration: CuReDesign.animationDurations[
                                CuReAnimationDuration.fast]!,
                            delay: Duration(milliseconds: 100 * i),
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(
                                    CuReDesign.borderRadius,
                                  ),
                                  splashFactory: Utils.getSplashFactory(),
                                  onTap: () {
                                    onAnswerTap(e);
                                  },
                                  child: Ink(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: answers[currentStep] != null &&
                                                answers[currentStep]!
                                                    .map((e) => e.id)
                                                    .contains(e.id)
                                            ? CuReDesign.primaryColor
                                                .withAlpha(30)
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: _getBorderColor(e),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(
                                          CuReDesign.borderRadius,
                                        ),
                                      ),
                                      child: Row(children: [
                                        if (e.icon != null)
                                          Icon(
                                            e.icon,
                                            size: 23,
                                          ),
                                        if (e.icon != null)
                                          CuReSpacing.horizontal(0.5),
                                        CuReText(
                                          e.text,
                                          size: 19,
                                        ),
                                        const Spacer(),
                                        if (widget.questions[currentStep]
                                            .multipleChoices) ...[
                                          CuReCheckbox(
                                            checked:
                                                answers[currentStep] != null &&
                                                    answers[currentStep]!
                                                        .map((e) => e.id)
                                                        .contains(e.id),
                                            onChanged: (value) {
                                              onAnswerTap(e);
                                            },
                                          )
                                        ] else ...[
                                          CuReRadio(
                                              value: e.id,
                                              onChanged: (value) {
                                                onAnswerTap(e);
                                              },
                                              groupValue: answers[currentStep]
                                                  ?.first
                                                  .id)
                                        ]
                                      ])),
                                )),
                          ))))
                  .values
                  .toList(),
            ]),
            const Spacer(),
            Row(
              children: [
                CuReButton(
                  label: CuReLocalization.get('back'),
                  icon: CuReIcons.arrowBack,
                  type: CuReButtonType.outlined,
                  minSize: Size(MediaQuery.of(context).size.width * 0.42, 48),
                  onPressed: currentStep > 0
                      ? () {
                          isGoingPrevious = true;
                          setState(() {
                            currentStep--;
                          });
                        }
                      : null,
                ),
                const Spacer(),
                CuReButton(
                  label: currentStep < widget.questions.length - 1
                      ? CuReLocalization.get('next')
                      : CuReLocalization.get('finish'),
                  icon: CuReIcons.arrowForward,
                  iconPosition: CuReIconPosition.suffix,
                  minSize: Size(MediaQuery.of(context).size.width * 0.42, 48),
                  onPressed: answers[currentStep] != null &&
                          answers[currentStep]!.isNotEmpty
                      ? () {
                          isGoingPrevious = false;
                          if (currentStep < widget.questions.length - 1) {
                            setState(() {
                              currentStep++;
                            });
                          } else {
                            if (widget.onFinish != null) {
                              widget.onFinish!(answers);
                            }
                          }
                        }
                      : null,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  void onAnswerTap(CuReSurveyAnswer answer) {
    if (widget.questions[currentStep].multipleChoices) {
      setState(() {
        if (answers[currentStep] == null) {
          answers[currentStep] = [];
        }
        if (answers[currentStep]!.map((e) => e.id).contains(answer.id)) {
          answers[currentStep]!
              .removeWhere((element) => element.id == answer.id);
        } else {
          if (widget.questions[currentStep].maxChoices != null &&
              answers[currentStep]!.length >=
                  widget.questions[currentStep].maxChoices!) {
            CuReNotifications.show(LocalNotification(
              description: CuReLocalization.get('survey_max_choices_reached'),
              type: LocalNotificationType.danger,
            ));
            return;
          }
          answers[currentStep]!.add(answer);
        }
      });
    } else {
      setState(() {
        answers[currentStep] = [answer];
      });
    }
  }

  Color _getBorderColor(CuReSurveyAnswer answer) {
    return answers[currentStep] != null &&
            answers[currentStep]!.map((e) => e.id).contains(answer.id)
        ? CuReDesign.primaryColor
        : Colors.grey.withAlpha(70);
  }
}
