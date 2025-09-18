# Slider Picker

---

## Example

```dart
int selectedPickerIndex = 0;

CuRePicker(
    options: ['Option 1', 'Option 2', 'Option 3'],
    selectedIndex: selectedPickerIndex,
):
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `selectedIndex` | `int` | The selected value | ✅ |
| `options` | `List<String>` | Options list | ✅ |
| `onSelected` | `Function(int)` | Emits an event when the user taps on a chip. Returns the selected value index | ❌ |
| `label` | `String` | If set it shows a label on the top of the picker | ❌ |
| `height` | `double` | If set it applies a custom height to the picker | ❌ |
| `itemExtent` | `double` | Height of the single option. Default is 40 | ❌ |
