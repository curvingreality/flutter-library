# Circular Progress Indicator

---

It replaces the default **CircularProgressIndicator** widget in order to implement custom logic and different UI based on the OS.

<div class="smartphone-container">
    <iframe src="https://www.curvingreality.com/projects/flutter-library/?screen=circular-progress-indicator" class="iframe-device" style="height: 79px !important;"></iframe>
</div>

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
