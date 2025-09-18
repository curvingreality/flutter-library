# Welcome Screen

---

A **ready-to-use**, fully animated and high customizable screen to use as a brief app introduction to show the user what is it about.<br>
Try it in the [interactive example](/#/example) under the **screens** section.

!> This and all the screens depend on the package [animate_do](https://pub.dev/packages/animate_do).

## Example

```dart
CuReWelcomeScreen(
    background: Image.asset(
        'assets/images/background.png',
    ),
    onFinish: () {
        Navigator.of(context).pop();
        // Do something...
    },
    logo: 'assets/images/logo.png',
    sections: [
        CuReWelcomeScreenSection(
            title: 'Welcome aboard ❤️',
            description:
                "Are you ready to speed up and improve your development process with the Curving Reality Library?",
            content: Image.asset(
            'assets/images/welcome/1.png',
            ),
        ),
        CuReWelcomeScreenSection(
            title: 'UI Components 🎨',
            description:
                'Stunning and ready to use UI components to speed up your development process.',
            content: Image.asset(
            'assets/images/welcome/2.png',
            ),
        ),
        CuReWelcomeScreenSection(
            title: 'Screens 📱',
            description:
                'Pre-built screens to get you started in no time.',
            content: Image.asset(
            'assets/images/welcome/3.png',
            ),
        ),
        CuReWelcomeScreenSection(
            title: 'Services ⚙️',
            description:
                'Ready to use services like localization, authentication and more to enhance your app development.',
            content: Image.asset(
            'assets/images/welcome/4.png',
            ),
        ),
    ],
);
```

## Properties

| Property            | Type                             | Description                                             | Mandatory |
| ------------------- | -------------------------------- | ------------------------------------------------------- | --------- |
| `sections`          | `List<CuReWelcomeScreenSection>` | The list of sections                                    | ✅        |
| `finishButtonLabel` | `String`                         | The label showed inside the finish button               | ❌        |
| `onFinish`          | `Function(void)`                 | Emits an event when the user taps on the Finish button  | ❌        |
| `logo`              | `String`                         | Path of a custom logo to show at the top of the screen  | ❌        |
| `background`        | `Image`                          | Adds a custom image background at the top of the screen | ❌        |
