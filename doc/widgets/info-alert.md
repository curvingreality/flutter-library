# Info Alert

---

## Example

```dart
CuReInfo(
    title: 'Success Alert',
    description:
        'Description for the success alert goes here.',
    type: CuReInfoType.success,
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `type` | `CuReInfoType` | Info alert type (info, warning, success, danger). Default is info. It automatically changes the background color and sets the icon based on the type | ❌ |
| `title` | `String` | Info alert title | ❌ |
| `description` | `String` | Info alert description | ❌ |
| `icon` | `IconData` | Info alert custom icon | ❌ |
| `color` | `Color` | Info alert custom background color | ❌ |
| `shape` | `CuReShape` | Shape of the info alert. Regular, rounded, squared. Default is the **CuReDesign.defaultElementsShape** (regular) | ❌ |
| `padding` | `EdgeInsets` | Custom info alert padding | ❌ |
| `child` | `Widget` | Custom widget to show inside the info alert | ❌ |
