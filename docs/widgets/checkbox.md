# Checkbox

---

It replaces the default **Checkbox** widget in order to implement custom logic and different UI based on the OS.

## Example

```dart
bool checked = true;

CuReCheckbox(
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
| `checked` | `bool` | Used to decide if the checkbox is checked or not | ❌ |
| `onChanged` | `Function(bool)` | Emits an event when the user check/uncheck the checkbox. Returns true if the checkbox is checked | ❌ |
| `color` | `Color` | Defines the color of the selected checkbox. Default is **CuReDesign.primaryColor** or **CuReDesign.disabledColor** if disabled | ❌ |
| `label` | `String` | If set it shows a label next to the checkbox | ❌ |
| `disabled` | `bool` | If set to true the checkbox is disabled and can't be checked/unchecked | ❌ |
| `size` | `double` | Checkbox width and height | ❌ |
| `icon` | `IconData` | Icon to show inside the checkbox when selected. Default is **CuReIcons.check** | ❌ |
