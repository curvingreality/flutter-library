# Switch

---

It replaces the default **Switch** widget in order to implement custom logic and different UI based on the OS.

## Example

```dart
bool checked = true;

CuReSwitch(
    label: 'Try me!',
    checked: checked,
    onChanged(value) {
        setState(() {
            checked = value;
        });
    }
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `checked` | `bool` | Used to decide if the switch is checked or not | ❌ |
| `onChanged` | `Function(bool)` | Emits an event when the user check/uncheck the switch. Returns true if the switch is checked | ❌ |
| `color` | `Color` | Defines the color of the selected switch. Default is **CuReDesign.primaryColor** or **CuReDesign.disabledColor** if disabled | ❌ |
| `label` | `String` | If set it shows a label next to the switch | ❌ |
| `disabled` | `bool` | If set to true the switch is disabled and can't be checked/unchecked | ❌ |
| `spaceBetween` | `bool` | If set to true it puts the switch in a row with the label on the left, space between and the switch on the right | ❌ |
| `alignment` | `Alignment` | Sets the alignment of the switch inside its invisible container | ❌ |
