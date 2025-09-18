# Sign Up Screen

---

A **ready-to-use**, fully animated and high customizable screen to use to sign up the user, with email and password or with third-party auth systems.<br>
Try it in the [interactive example](/#/example) under the **screens** section.

!> This and all the screens depend on the package [animate_do](https://pub.dev/packages/animate_do).

## Example

```dart
CuReSignUpScreen(
    emailNotConfirmed: false,
        background: Image.asset(
        'assets/images/background.png',
        ),
    logo: Image.asset('assets/images/logo.png' width: 150),
    onSignIn: () => {
        // Do something...
    },
    onSignUp: () => {
        // Do something...
    },
    onThirdPartSignUp(type) {
        // Do something...
    },
    content: Column(children: [
        // Other optional text fields
    ]),
    termsOfServiceUrl: 'https://www...',
    privacyPolicyUrl: 'https://www...',
    thirdPartAuthTypes: [
        CuReAuthType.apple,
        CuReAuthType.google,
        CuReAuthType.facebook,
        CuReAuthType.linkedin,
    ],
);
```

## Properties

| Property                    | Type                     | Description                                                                                                                | Mandatory |
| --------------------------- | ------------------------ | -------------------------------------------------------------------------------------------------------------------------- | --------- |
| `onSignUp`                  | `Function(void)`         | Emits an event when the user taps on the Sign Up button                                                                    | ✅        |
| `onSignIn`                  | `Function(void)`         | Emits an event when the user taps on the Sign In button                                                                    | ✅        |
| `title`                     | `String`                 | The title displayed at the top of the screen                                                                               | ❌        |
| `description`               | `String`                 | The description displayed at the top of the screen, under the title                                                        | ❌        |
| `logo`                      | `Widget`                 | Custom widget shown as logo at the top of the screen                                                                       | ❌        |
| `background`                | `Image`                  | Adds a custom image background at the top of the screen                                                                    | ❌        |
| `content`                   | `Widget`                 | Used to put a custom Widget under the email and password fields, to add more text fields or other                          | ❌        |
| `thirdPartAuthTypes`        | `List<CuReAuthType>`     | A list that specifies the third-party available to the users to sign up                                                    | ❌        |
| `onThirdPartSignUp`         | `Function(CuReAuthType)` | Emits an event with the the third-party tapped from the user                                                               | ❌        |
| `termsOfServiceUrl`         | `String`                 | URL set that shows a disclaimer at the bottom of the screen with a link                                                    | ❌        |
| `privacyPolicyUrl`          | `String`                 | URL set that shows a disclaimer at the bottom of the screen with a link                                                    | ❌        |
| `signUpEnabled`             | `bool`                   | If set to false it disables the Sign Up button                                                                             | ❌        |
| `isCreating`                | `bool`                   | Used to trigger a loading state while the sign up request is processing                                                    | ❌        |
| `emailNotConfirmed`         | `bool`                   | If set to true shows a different screen with an alert to confirm the sign up email                                         | ❌        |
| `onEmailVerificationResend` | `Function(void)`         | Event triggered when the user taps on the resend verification email button when the **emailNotConfirmed** screen is active | ❌        |
| `onSignInAgain`             | `Function(void)`         | Event triggered when the user taps on the sign in button when the **emailNotConfirmed** screen is active                   | ❌        |
