# Forgot Password Screen

---

A **ready-to-use**, fully animated and high customizable screen to help the user to recover the password.<br>
Try it in the [interactive example](/#/example) under the **screens** section.

!> This and all the screens depend on the package [animate_do](https://pub.dev/packages/animate_do).

## Example

```dart
CuReForgotPasswordScreen(
    onPasswordResetSend: () {
        // Do something...
    },
    background: Image.asset('assets/images/background.png'),
    logo: Image.asset('assets/images/logo2.png', width: 200),
);
```

## Properties

| Property              | Type             | Description                                                      | Mandatory |
| --------------------- | ---------------- | ---------------------------------------------------------------- | --------- |
| `logo`                | `Image`          | Logo shown at the center of the page                             | ✅        |
| `onPasswordResetSend` | `Function(void)` | Emits an event when the user taps on the recover password button | ❌        |
| `isSending`           | `bool`           | Used to trigger a loading state when the request is in process   | ❌        |
| `background`          | `Image`          | Adds a custom image background at the top of the screen          | ❌        |
