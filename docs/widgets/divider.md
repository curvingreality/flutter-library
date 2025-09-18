# Divider

---

## Example

```dart
CuReDivider(
    color: CuReDesign.successColor,
    height: 5,
    width: MediaQuery.of(context).size.width * 0.8,
    label: 'Label',
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `width` | `double` | Defines the divider width. Default is **double.infinity** | ❌ |
| `height` | `double` | Defines the divider height. Default is 1 | ❌ |
| `color` | `Color` | Defines the divider color | ❌ |
| `padding` | `EdgeInsets` | Custom outside padding | ❌ |
| `label` | `String` | If set it shows a label in the middle of the divider | ❌ |
| `asBadge` | `bool` | If set it shows the label in the middle with the UI of a badge | ❌ |
