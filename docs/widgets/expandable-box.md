# Expandable Box

---

## Example

```dart
CuReExpandableBox(
    title: 'Tap to expand',
    icon: CuReIcons.info,
    child: CuReText('This is the content'),
);
```

final String title;
final Widget child;
final bool filled;
final Color? color;
final IconData? icon;
final CuReShape? shape;
final Function? onTap;

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `icon` | `IconData` | The icon to show at the top of the empty state. Default is **CuReIcons.closeCircle** | ❌ |
| `iconChild` | `Widget` | Custom widget to show at the top of the empty state | ❌ |
| `title` | `String` | Empty state title | ❌ |
| `description` | `String` | Empty state description | ❌ |
| `child` | `Widget` | Custom widget to show at the end of the empty state | ❌ |
| `padding` | `EdgeInsets` | Empty state padding | ❌ |
