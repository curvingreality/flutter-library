# Radio

---

It replaces the default **Radio** widget in order to implement custom logic and different UI based on the OS.

## Example

```dart
String selectedValue = 'one';

Column(
  children: [
    CuReRadio(
      value: 'one',
      groupValue: selectedValue,
      label: 'Option One',
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    ),
    CuReRadio(
      value: 'two',
      groupValue: selectedValue,
      label: 'Option Two',
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    ),
  ],
);
```

## Properties

| Property     | Type                | Description                                                                                                           | Mandatory |
| ------------ | ------------------- | --------------------------------------------------------------------------------------------------------------------- | --------- |
| `value`      | `dynamic`           | The **value** associated with the radio button. Must match the type of **groupValue**                                 | ✅        |
| `groupValue` | `dynamic`           | The **group value**. If equal to **value**, the radio appears selected                                                | ✅        |
| `onChanged`  | `Function(dynamic)` | Called when the user selects the radio option. Returns the selected value                                             | ✅        |
| `color`      | `Color`             | The **color** of the selected radio. Default: **CuReDesign.primaryColor** or **CuReDesign.disabledColor** if disabled | ❌        |
| `label`      | `String`            | If set it shows a label next to the radio                                                                             | ❌        |
| `disabled`   | `bool`              | If **true**, the radio is disabled and cannot be selected                                                             | ❌        |
