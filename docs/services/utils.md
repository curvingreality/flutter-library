# Utils

---

## Check iOS

Returns true if the system is using **iOS** or **Mac OS**.

```dart
CuReUtils.isIOs();
```

## Navigate to

Navigate to a screen with the system specific animation (iOS, Android).

```dart
CuReUtils.navigateTo(context, const NewScreen());
```

## Navigate replace

Replace the current screen with a new one with the system specific animation (iOS, Android).

```dart
CuReUtils.navigateReplace(context, const NewScreen());
```

## Navigate back

Pop to the previous screen.

```dart
CuReUtils.navigateBack();
```

## Email validity

Returns **true** if the email is valid.

```dart
CuReUtils.isEmailValid('john.doe@gmail.com');
```

## Open URL

Method used to open a web URL.

!> This method depends on the [url_launcher](https://pub.dev/packages/url_launcher) package.

```dart
CuReUtils.openUrl('https://www.curvingreality.com/', false); // Opens in the internal app browser
CuReUtils.openUrl('https://www.curvingreality.com/', true); // Opens in the external app browser
```

## Darken

A useful function that returns a **darker color** from a starting one.

```dart
CuReUtils.darken(Color(0xff0088ff), 0.4); // From 0.1 to 1.0 intensity
```

## Lighten

A useful function that returns a **lighter** Color from a starting one.

```dart
CuReUtils.lighten(Color(0xff0088ff), 0.4); // From 0.1 to 1.0 intensity
```

## Dark mode active

Returns **true** if the system has dark mode active.

```dart
CuReUtils.isSystemDarkModeActive();
```

## Dark mode wrapper

It is used to display a **dynamic** widget or any kind of data based on the dark mode setting.<br>
It's useful in order to keep the code clean avoiding inline if-else statements and reduntant code.<br>
The **first parameter** indicates the return value if the dark mode is **disabled**, while the second parameter the opposite.

```dart
// Example with a string
Image.asset(CuReUtils.darkModeWrapper('images/logo-dark.png', 'images/logo-white.png'));

// Example with a widget
CuReUtils.darkModeWrapper(
    Image.asset('assets/images/logo-icon-dark.png', height: 150),
    Image.asset('assets/images/logo-icon-white.png', height: 150),
);
```

## Dialog

Opens a dialog with the current system style and animations (iOS, Android).

```dart
// Dialog with custom content (you can use every widget you want)
CuReUtils.openDialog(context, 'Title', content: CuReText('This is the dialog content'));

// Dialog with actions
CuReUtils.openDialog(context, 'Title', content: CuReText('This is the dialog content'), actions: [
    CuReDialogAction(label: 'Action 1', color: Colors.blue, onPressed: () {
        // Something to do
    }),
    CuReDialogAction(label: 'Action 2', color: Colors.red, onPressed: () {
        // Something to do
    })
]);
```

## Bottom sheet

Opens a bottom sheet with the current system style and animations (iOS, Android).

```dart
// Bottom sheet with custom content (you can use every widget you want)
CuReUtils.openBottomSheet(context, 'Title', content: CuReText('This is the bottom sheet content'));

// Bottom sheet with actions
CuReUtils.openBottomSheet(context, 'Title', content: CuReText('This is the bottom sheet content'), actions: [
    CuReDialogAction(label: 'Action 1', color: Colors.blue, onPressed: () {
        // Something to do
    }),
    CuReDialogAction(label: 'Action 2', color: Colors.red, onPressed: () {
        // Something to do
    })
]);
```

## Debouncer

Method used to delay a certain action.

```dart
final _debouncer = CuReDebouncer(milliseconds: 500);
_debouncer.run(() {
    // Activity to run after X milliseconds
});

_debouncer.dispose(); // Cancels the timer
```

## Icon to string

A useful method that converts an **IconData** into a **String**.

```dart
String icon = CuReUtils.fromIconToString(Icons.close);
```

## String to icon

A useful method that converts a **String** into an **IconData**.

```dart
IconData icon = CuReUtils.fromStringToIcon('icon string');
```

## Dates

Useful methods to retrieve localized months and week days names.

```dart
List<String> months = CuReUtils.getMonthsNames();
List<String> weekDays = CuReUtils.getWeekDaysNames();
```

!> Available languages: **english, italian**

## HTML parsing

Method that converts an HTML string in a RichText.

```dart
RichText text = CuReUtils.parseHtml('I am a <b>HTML</b> string');
```

!> At the moment it only supports these HTML tags: **b**
