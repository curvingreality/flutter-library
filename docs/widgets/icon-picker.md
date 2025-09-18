# Icon picker

---

Used to show a selection of custom icons to choose from, divided by groups.

## Example

```dart
final List<CuReIconPickerList> icons = [
    CuReIconPickerList(label: 'Group 1', icons: [CuReIcons.close, CuReIcons.arrowBack]),
    CuReIconPickerList(label: 'Group 2', icons: [CuReIcons.folder, CuReIcons.phone]),
];

CuReIconPicker(
    label: 'Select an icon',
    icons: icons,
    onSelected(icon) {
        // Something to do
    }
);
```

## Properties

| Property       | Type     | Description                                                                                       | Mandatory |
| -------------- | -------- | ------------------------------------------------------------------------------------------------- | --------- |
| `selectedIcon` | `Icon`   | Changes default selected icon                                                                     | ❌        |
| `size`         | `double` | Selected icon size                                                                                | ❌        |
| `spaceBetween` | `bool`   | Moves the description label from top to the left and adds space between the selected icon and the | ❌        |
| `color`        | `Color`  | Color of the selected icon and all the possible icons in lists                                    | ❌        |
