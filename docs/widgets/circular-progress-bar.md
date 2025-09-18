# Circular Progress Bar

---

## Example

```dart
CuReCircularProgressBar(
    percentage: 70,
    size: 70,
    showPercentage: true,
    color: CuReDesign.successColor,
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `percentage` | `double` | Defines how full the circular progress bar is | ✅ |
| `color` | `Color` | Defines the color of circular progress bar. Default is **CuReDesign.primaryColor** | ❌ |
| `size` | `double` | Defines the circular progress bar stroke width and the label size | ❌ |
| `showPercentage` | `bool` | If true it shows the percentage label inside the circular progress bar | ❌ |
| `child` | `Widget` | If set it shows the custom widget inside the circular progress bar | ❌ |
