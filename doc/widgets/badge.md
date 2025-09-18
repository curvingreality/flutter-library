# Badge

---

## Example

```dart
CuReBadge(
    label: 'I am a badge',
    icon: CuReIcons.phone,
    color: CuReDesign.successColor,
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `label` | `String` | The label to show inside the badge | ❌ |
| `icon` | `IconData` | The icon to show inside the badge to the left of the label | ❌ |
| `color` | `Color` | The badge background color (it will apply alpha to 60) and border | ❌ |
| `padding` | `EdgeInsets` | The padding inside the badge | ❌ |
| `shape` | `CuReShape` | Shape of the badge. Regular, rounded, squared. Default is the **CuReDesign.defaultElementsShape** (regular) | ❌ |
| `fontSize` | `double` | Font size of the label | ❌ |
| `child` | `Widget` | Custom widget to show inside the badge | ❌ |
