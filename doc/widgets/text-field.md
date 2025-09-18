# Text Fields

---

The **CuReTextField** component provides simple and unique validation methods combined with UI elements in order to create powerful forms in no-time.

## Basic usage

```dart
final TextEditingController _controller = TextEditingController();

CuReTextField(
    controller: _controller,
    placeholder: "123",
    label: "Phone number",
    prefixIcon: CuReIcons.phone,
);
```

## Number field

```dart
final TextEditingController _controller = TextEditingController();

CuReTextField(
    controller: _controller,
    label: 'Number field with validation',
    placeholder: 'Your age',
    type: CuReTextFieldType.number,
    validator: CuReTextFieldValidator(min: 3, max: 100),
    shape: shape,
);
```

## Email field

```dart
final TextEditingController _controller = TextEditingController();

CuReTextField(
    controller: _controller,
    label: 'Email field with validation',
    placeholder: 'Your email',
    type: CuReTextFieldType.email,
    shape: shape,
);
```

## Date field

```dart
final TextEditingController _controller = TextEditingController();

CuReTextField(
    controller: _controller,
    label: 'Date field with validation',
    placeholder: 'Your birth date',
    type: CuReTextFieldType.date,
    validator: CuReTextFieldValidator(
        minDate: DateTime(1900, 1, 1),
        maxDate: DateTime.now(),
    ),
    shape: shape,
);
```

## Time field

```dart
final TextEditingController _controller = TextEditingController();

CuReTextField(
    controller: _controller,
    label: 'Time field with validation',
    placeholder: 'Task time',
    type: CuReTextFieldType.time,
    validator: CuReTextFieldValidator(
        minDate: DateTime(1900, 1, 1),
        maxDate: DateTime.now(),
    ),
);
```

## Options field

It shows a text field that can be tapped to show a dialog with selectable options

```dart
final TextEditingController _controller = TextEditingController();

CuReTextField(
    controller: _controller,
    label: 'Options field',
    placeholder: 'Select an option',
    options: [
        CuReDropdownItem(value: '1', label: 'Option 1'),
        CuReDropdownItem(value: '2', label: 'Option 2'),
        CuReDropdownItem(
            value: '3',
            label: 'Option 3',
            icon: CuReIcons.celebration,
        ),
    ],
);
```

## Types

| Enum                | Value      | Description                                                                                     |
| ------------------- | ---------- | ----------------------------------------------------------------------------------------------- |
| `CuReTextFieldType` | `text`     | Default                                                                                         |
| `CuReTextFieldType` | `number`   | -                                                                                               |
| `CuReTextFieldType` | `datetime` | -                                                                                               |
| `CuReTextFieldType` | `date`     | -                                                                                               |
| `CuReTextFieldType` | `time`     | -                                                                                               |
| `CuReTextFieldType` | `email`    | It automatically checks if the field contains a valid email                                     |
| `CuReTextFieldType` | `password` | It makes the field characters not visible, and shows an eye icon on the right to show/hide them |

## Validators

Providing a **validator (CuReTextFieldValidator)** property automatically checks for errors in the field.<br>
These are the possible values:

| Class                    | Property         | Type       | Description                                                                                                                                                                       |
| ------------------------ | ---------------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CuReTextFieldValidator` | `errorText`      | `String`   | The error message is automatically translated by the internal service. If you want to use a custom message provide this property                                                  |
| `CuReTextFieldValidator` | `required`       | `bool`     | If set to true the field must be filled in                                                                                                                                        |
| `CuReTextFieldValidator` | `noSpaces`       | `bool`     | If set to true it checks for empty spaces in the field                                                                                                                            |
| `CuReTextFieldValidator` | `min`            | `int`      | Specifies a minimum number                                                                                                                                                        |
| `CuReTextFieldValidator` | `max`            | `int`      | Specifies a maximum number                                                                                                                                                        |
| `CuReTextFieldValidator` | `minDate`        | `DateTime` | Specifies a minimum date                                                                                                                                                          |
| `CuReTextFieldValidator` | `maxDate`        | `DateTime` | Specifies a maximum date                                                                                                                                                          |
| `CuReTextFieldValidator` | `minAge`         | `int`      | Specifies a minimum age to set in the date type field                                                                                                                             |
| `CuReTextFieldValidator` | `max`            | `int`      | Specifies a maximum age to set in the date type field                                                                                                                             |
| `CuReTextFieldValidator` | `securePassword` | `bool`     | If set to true and the field is type password, it checks if the password contains at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character |
| `CuReTextFieldValidator` | `regex`          | `RegExp`   | Custom Regular Expression                                                                                                                                                         |

final CuReTextFieldValidator? validator;
final CuReTextFieldType? type;
final List<CuReDropdownItem>? options;

## Properties

| Property       | Type                     | Description                                                                                                           | Mandatory |
| -------------- | ------------------------ | --------------------------------------------------------------------------------------------------------------------- | --------- |
| `controller`   | `TextEditingController`  | Field controller                                                                                                      | ✅        |
| `placeholder`  | `String`                 | Hints to show inside the text field when it is empty                                                                  | ❌        |
| `label`        | `String`                 | If set, it shows a label on the top of the text field                                                                 | ❌        |
| `textAlign`    | `TextAlign`              | Alignment of the label and the inner field text                                                                       | ❌        |
| `prefixIcon`   | `IconData`               | If set it shows an icon inside the text field, before the input                                                       | ❌        |
| `suffixIcon`   | `IconData`               | If set it shows an icon inside the text field, after the input                                                        | ❌        |
| `suffix`       | `Widget`                 | If set it shows a custom widget inside the text field, after the input                                                | ❌        |
| `fontSize`     | `double`                 | Text field font size                                                                                                  | ❌        |
| `fontWeight`   | `FontWeight`             | Text field font weight                                                                                                | ❌        |
| `showBorder`   | `bool`                   | If set to true it shows a border around the text field                                                                | ❌        |
| `borderRadius` | `double`                 | Custom text field border radius                                                                                       | ❌        |
| `shape`        | `CuReShape`              | Shape of the text field. Regular, rounded, squared. Default is the **CuReDesign.defaultElementsShape** (regular)      | ❌        |
| `color`        | `Color`                  | Custom text field background color                                                                                    | ❌        |
| `showCounter`  | `bool`                   | If set to true it shows a counter on the bottom right of the text field with the current text field characters length | ❌        |
| `multiline`    | `bool`                   | If set to true the user can insert multiple lines                                                                     | ❌        |
| `maxLines`     | `int`                    | The maximum lines the user can insert                                                                                 | ❌        |
| `readonly`     | `bool`                   | If set to true the user can't edit the text field value                                                               | ❌        |
| `disabled`     | `bool`                   | If set to true the user can't edit the text field value and the field appears disabled                                | ❌        |
| `type`         | `CuReTextFieldType`      | Specifies the text field type                                                                                         | ❌        |
| `validator`    | `CuReTextFieldValidator` | Specifies the text field validations                                                                                  | ❌        |
| `options`      | `List<CuReDropdownItem>` | If set it shows a text field that can be tapped to show a dialog with selectable options                              | ❌        |
| `onValidation` | `Function(bool)`         | Emits an event after the validator finished checking the field. Returns false if the field is not valid               | ❌        |
| `onChanged`    | `Function(String)`       | Emits an event when the user changes the value of the field. Returns the current value                                | ❌        |
| `onSubmitted`  | `Function(String)`       | Emits an event when the user presses submits on the field. Returns the current value                                  | ❌        |
