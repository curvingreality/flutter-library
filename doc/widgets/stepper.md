# Stepper

---

## Example

```dart
int currentStep = 1;

Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
        CuReStepper(
            totalSteps: 5,
            currentStep: currentStep,
            onStepChange: (step) {
                setState(() {
                    currentStep = step;
                });
            },
        ),
    ],
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `totalSteps` | `int` | The number of total steps to show | ✅ |
| `currentStep` | `int` | The number of the current step | ✅ |
| `onStepChange` | `Function(int)` | Emits an event when the user taps on the step. Returns the step number | ❌ |
| `hideNumbers` | `bool` | If set to true it hides the numbers inside the steps | ❌ |
| `separatorSize` | `int` | The amount of dots between the steps. Default is 3 | ❌ |
| `shape` | `CuReShape` | Shape of the step. Regular, rounded, squared. Default is rounded | ❌ |
| `disabled` | `bool` | If set to true the user can't tap on the steps and the steps become grey | ❌ |
| `readonly` | `bool` | If set to true the user can't tap on the steps | ❌ |
| `color` | `Color` | Custom steps and separators color | ❌ |
| `vertical` | `bool` | If set to true the steps and the separators are shown vertically | ❌ |
