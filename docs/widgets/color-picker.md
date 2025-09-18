# Color picker

---

Used to show a selection of custom colors to choose from.<br>
You can select a color from a **dialog** or directly from the **screen**.

## Picker with dialog

```dart
final List<Color> colors = [
    Colors.red,
    Colors.green
    Colors.blue,
];

CuReColorPicker(
    colors: colors,
    label: "Select a color",
    onSelected((color) {
        // Something to do
    }),
);
```

## Picker without dialog

```dart
final List<Color> colors = [
    Colors.red,
    Colors.green
    Colors.blue,
];

CuReColorPicker(
    colors: colors,
    label: "Select a color",
    withoutDialog: true,
    onSelected((color) {
        // Something to do
    }),
);
```

## Properties

| Property        | Type    | Description                                                                                        | Mandatory |
| --------------- | ------- | -------------------------------------------------------------------------------------------------- | --------- |
| `selectedColor` | `Color` | Changes default selected color                                                                     | ❌        |
| `spaceBetween`  | `bool`  | Moves the description label from top to the left and adds space between the selected color and the | ❌        |
