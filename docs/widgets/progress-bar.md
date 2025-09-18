# Progress Bar

---

## Example

```dart
CuReProgressBar(
    label: 'With label and percentage',
    showPercentageLabel: true,
    percentage: 40,
    width: MediaQuery.of(context).size.width * 0.8,
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `percentage` | `double` | Defines how full the progress bar is | ✅ |
| `width` | `double` | Progress bar width | ✅ |
| `height` | `double` | Progress bar height | ❌ |
| `color` | `Color` | Defines the color of circular progress bar. Default is **CuReDesign.primaryColor** | ❌ |
| `label` | `String` | If set it shows a label on the bottom left of the progress bar | ❌ |
| `showPercentageLabel` | `bool` | If set to true it shows the percentage value on the bottom right of the progress bar | ❌ |
| `borderRadius` | `double` | Progress bar border radius | ❌ |
| `removeAnimation` | `bool` | If set to true it removes the default progress bar animation | ❌ |
