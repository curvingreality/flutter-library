# Sign In Screen

---

A **ready-to-use**, fully animated and high customizable screen to use to sign in the user, with email and password or with third-party auth systems.<br>
Try it in the [interactive example](/#/example) under the **screens** section.

!> This and all the screens depend on the package [animate_do](https://pub.dev/packages/animate_do).

<div class="smartphone-container">
    <iframe src="https://www.curvingreality.com/projects/flutter-library/?screen=sign-in-screen" style="height: 900px !important;"></iframe>
</div>

## Example

```dart
CuReSignInScreen(
    background: Image.asset(
    'assets/images/background.png',
    ),
    onSignIn: (values) => {
        // Do something...
    },
    onThirdPartSignIn(type) {
        // Do something...
    }
    onSignUp: () {
        // Do something...
    },
    thirdPartAuthTypes: [
        CuReAuthType.apple,
        CuReAuthType.google,
        CuReAuthType.facebook,
        CuReAuthType.linkedin,
    ],
    logo: Image.asset('assets/images/logo.png', width: 200),
);
```

## Properties

| Property             | Type                          | Description                                                                   | Mandatory |
| -------------------- | ----------------------------- | ----------------------------------------------------------------------------- | --------- |
| `onSignIn`           | `Function(CuReSignInPayload)` | Emitte the user and password payload when the user taps on the Sign In button | ✅        |
| `onThirdPartSignIn`  | `Function(CuReAuthType)`      | Emits an event with the the third-party tapped from the user                  | ❌        |
| `thirdPartAuthTypes` | `List<CuReAuthType>`          | A list that specifies the third-party available to the users to sign in       | ❌        |
| `logo`               | `Widget`                      | Custom widget shown as logo at the top of the screen                          | ❌        |
| `background`         | `Image`                       | Adds a custom image background at the top of the screen                       | ❌        |
| `isLoading`          | `bool`                        | Used to trigger a loading state while the sign in request is processing       | ❌        |
| `onForgotPassword`   | `Function(void)`              | Emitted when a user taps on the "forgot password" button                      | ❌        |
| `onSignUp`           | `Function(void)`              | Emitted when a user taps on the "sign up" button                              | ❌        |
