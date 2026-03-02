# Sign Up Screen

---

A **ready-to-use**, fully animated and high customizable screen to use to show a survey (list of questions with single/multiple answers).<br>
Try it in the [interactive example](/#/example) under the **screens** section.

!> This and all the screens depend on the package [animate_do](https://pub.dev/packages/animate_do).

## Example

```dart
CuReSurveyScreen(
    onSkip: () {
        Navigator.of(context).pop();
        // Do something...
    },
    logo: CuReUtils.darkModeWrapper('assets/images/logo-dark.png', 'assets/images/logo-white.png')
    onFinish: (answers) {
        // Do something...
    },
    questions: [
        CuReSurveyQuestion(
            question: 'How many hours do you spend on your phone?',
            answers: [
                CuReSurveyAnswer(text: '😌 1-2 hours', id: 1),
                CuReSurveyAnswer(text: '😊 2-4 hours', id: 2),
                CuReSurveyAnswer(text: '😅 4-6 hours', id: 3),
                CuReSurveyAnswer(text: '😩 6+ hours', id: 4),
            ],
        ),
        CuReSurveyQuestion(
            question: 'How many hours do you sleep at night?',
            answers: [
                CuReSurveyAnswer(
                    text: '😎 I don\'t sleep',
                    id: 1,
                ),
                CuReSurveyAnswer(
                    text: '🥱 Less than 6 hours',
                    id: 2,
                    selected: true,
                ),
                CuReSurveyAnswer(text: '😌 6-7 hours', id: 3),
                CuReSurveyAnswer(text: '😴 7+ hours', id: 4),
            ],
        ),
        CuReSurveyQuestion(
            multipleChoices: true,
            maxChoices: 3,
            question: 'What is your favorite way to relax?',
            answers: [
                CuReSurveyAnswer(text: '📖 Reading', id: 1),
                CuReSurveyAnswer(text: '🎮 Gaming', id: 2),
                CuReSurveyAnswer(
                    text: '🏃‍♂️ Exercising',
                    id: 3,
                ),
                CuReSurveyAnswer(
                    text: '🛀 Taking a bath',
                    id: 4,
                ),
            ],
        ),
    ],
);
```

## Properties

| Property          | Type                                         | Description                                                                                                                      | Mandatory |
| ----------------- | -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `questions`       | `List<CuReSurveyQuestion>`                   | The list of questions                                                                                                            | ✅        |
| `onSkip`          | `Function(void)`                             | Emits an event when the user taps on the Skip button                                                                             | ❌        |
| `onFinish`        | `Function(Map<int, List<CuReSurveyAnswer>>)` | Emits an event when the user taps on the Finish button. It returns a map with the question id and theh list of the given answers | ❌        |
| `logo`            | `Widget`                                     | Custom widget shown as logo at the top right of the screen                                                                       | ❌        |
| `hideProgressBar` | `bool`                                       | Hides the progress bar on top if set to true                                                                                     | ❌        |
