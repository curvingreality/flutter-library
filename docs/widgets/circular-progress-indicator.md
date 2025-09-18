# Circular Progress Indicator

---

It replaces the default **CircularProgressIndicator** widget in order to implement custom logic and different UI based on the OS.

## Example

```dart
CuReCircularProgressIndicator(
    color: CuReDesign.dangerColor,
    size: CuReProgressIndicatorSize.large,
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `color` | `Color` | Custom indicator color. Default is **CuReDesign.primaryColor** | ❌ |
| `size` | `CuReProgressIndicatorSize` | Custom indicator size. Default is **CuReProgressIndicatorSize.small** | ❌ |
