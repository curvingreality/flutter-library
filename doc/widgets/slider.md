# Slider

---

It replaces the default **Slider** widget in order to implement custom logic and different UI based on the OS.

## Example

```dart
double value = 20;

CuReSlider(
    value: value,
    min: 10,
    max: 100,
    onChanged(value) {
       // Do something...
    }
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `onChanged` | `Function(double)` | Emits an event when the user interacts with the slider. Returns the value | ❌ |
| `thumbColor` | `Color` | Defines the color of the thumb slider | ❌ |
| `activeColor` | `Color` |The color to use for the portion of the slider that has been selected.| ❌ |
| `min` | `double` | The minimum value | ❌ |
| `max` | `double` | The maximum value | ❌ |
| `value` | `double` | The current value | ❌ |
