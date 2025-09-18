# Toggle Buttons

---

## Example

```dart
List<CuReToggleButtonsItem> toggleOptions = [
    CuReToggleButtonsItem(icon: CuReIcons.home),
    CuReToggleButtonsItem(icon: CuReIcons.settings),
    CuReToggleButtonsItem(icon: CuReIcons.person),
];

Column(
    children: [
        CuReToggleButtons(
            options: toggleOptions,
            allowJustOne: true,
        ),
    ],
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `options` | `List<CuReToggleButtonsItem>` | List of options | ❌ |
| `onToggle` | `CuReToggleButtonsItem` | Emits an event when the user select a toggle. Returns the selected item | ❌ |
| `shape` | `CuReShape` | Shape of the buttons. Regular, rounded, squared. Default is the **CuReDesign.defaultElementsShape** (regular) | ❌ |
| `allowJustOne` | `bool` | If set to true the user can only select one item | ❌ |
| `size` | `double` | Defines padding, icon and text size. Default is 16 | ❌ |
| `textColor` | `Color` | Defines icon and text color | ❌ |
