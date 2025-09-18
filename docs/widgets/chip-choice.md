# Chip Choice

---

## Example

```dart
CuReChipChoice(
    items: [
        CuReChipChoiceItem(label: 'Option 1', value: 1),
        CuReChipChoiceItem(label: 'Option 2', value: 2),
        CuReChipChoiceItem(label: 'Option 3', value: 3),
    ],
    onSelect: (value) {
        // Do something...
    },
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `selected` | `dynamic` | The selected value | ✅ |
| `items` | `List<CuReChipChoiceItem>` | Items list | ✅ |
| `onSelect` | `Function(dynamic)` | Emits an event when the user taps on a chip. Returns the selected value | ✅ |
| `shape` | `CuReShape` | Shape of the card. Regular, rounded, squared. Default is the **CuReDesign.defaultElementsShape** (regular) | ❌ |
