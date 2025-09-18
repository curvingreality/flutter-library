# Buttons

---

## Example

```dart
// Primary button with label and icon
CuReButton(icon: CuReIcons.close, onPressed: () {
    // Something to do
});

// Outlined button with label and icon
CuReButton(icon: CuReIcons.close, type: CuReButtonType.outlined, onPressed: () {
    // Something to do
});

// Text button with label and icon
CuReButton(icon: CuReIcons.close, type: CuReButtonType.text, onPressed: () {
    // Something to do
});

// Disabled button
CuReButton(label: 'Text', disabled: true);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `type` | `CuReButtonType` | Primary, outlined, text. Default is primary | ❌ |
| `shape` | `CuReShape` | Regular, rounded, squared. Default is the **CuReDesign.defaultElementsShape** (regular) | ❌ |
| `label` | `String` | Defines a label for the button| ❌ |
| `icon` | `IconData` | Set an icon to display inside the button | ❌ |
| `iconPosition` | `CuReIconPosition` | Set the icon position inside the button. Default is **left (prefix)** | ❌ |
| `onPressed` | `Function(void)` | Emits an event when the button is pressed | ❌ |
| `isLoading` | `bool` | If set to true it disables the button and shows a loading spinner inside it | ❌ |
| `minSize` | `Size` | Set the button minimum size | ❌ |
| `child` | `Widget` | Set a custom content inside the button | ❌ |
| `color` | `Color` | Set the button color. Default is **CuReDesign.primaryColor** or **CuReDesign.disabledColor** if disabled | ❌ |
| `disabled` | `bool` | If set to true the button is disabled and can't be tapped | ❌ |
| `customPrefix` | `Widget` | A custom widget to show before the label | ❌ |
| `iconSize` | `double` | Set the icon size of the icon set | ❌ |
| `padding` | `EdgeInsets` | Custom padding inside the button | ❌ |
| `margin` | `EdgeInsets` | Custom padding outside the button | ❌ |
| `size` | `CuReButtonSize` | Define a fixed size for the button. Small, medium, large. Default is **medium** | ❌ |
