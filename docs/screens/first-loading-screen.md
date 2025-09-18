# First Loading Screen

---

A **ready-to-use**, fully animated and high customizable screen to show when you open the app, while you load some stuff.<br>
Try it in the [interactive example](/#/example) under the **screens** section.

!> This and all the screens depend on the package [animate_do](https://pub.dev/packages/animate_do).

## Example

```dart
CuReFirstLoadingScreen(
    logo: Image.asset('assets/images/logo-icon-dark.png', width: 100, height: 100, fit: BoxFit.cover,),
    description: 'Loading, please wait...',
    ownerLogo: 'assets/images/company-logo.png',
    child: CuReButton(
        label: 'Go back',
        icon: CuReIcons.arrowBack,
        type: CuReButtonType.outlined,
        onPressed: () {
            Navigator.of(context).pop()
            // Do nothing...
        },
    ),
);
```

## Properties

| Property      | Type     | Description                                                                               | Mandatory |
| ------------- | -------- | ----------------------------------------------------------------------------------------- | --------- |
| `description` | `String` | The description text that appears under the logo                                          | ✅        |
| `logo`        | `Image`  | Logo shown at the center of the page                                                      | ❌        |
| `child`       | `Widget` | A custom widget to put at the center of the screen under the description                  | ❌        |
| `ownerLogo`   | `String` | Image path of the image of the app owner that will be visible at the bottom of the screen | ❌        |
