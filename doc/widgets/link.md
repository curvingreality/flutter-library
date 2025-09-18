# Link

---

It shows a label that can be tapped to open an URL.

!> This widget depends on the package [url_launcher](https://pub.dev/packages/url_launcher).

## Example

```dart
CuReLink(
    label: 'Open our website',
    url: 'https://www.curvingreality.com',
    openInExternalBrowser: true
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `label` | `String` | The label to show | ✅ |
| `url` | `String` | The URL to open when the link is pressed | ❌ |
| `openInExternalBrowser` | `bool` | If set to true it opens the URL inside the default system browser external to the app | ❌ |
| `color` | `Color` | The link color. Default is **CuReDesign.primaryColor** with alpha 200 applied | ❌ |
| `onPressed` | `Function(void)` | Emits an event when the user taps on the link | ❌ |
| `padding` | `EdgeInsets` | Custom link padding | ❌ |
| `size` | `double` | Link font size | ❌ |
