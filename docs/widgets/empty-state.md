# Empty State

---

## Example

```dart
 CuReEmptyState(
    title: 'No Data Available',
    description: 'There is currently no data to display.',
    icon: CuReIcons.error,
    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `icon` | `IconData` | The icon to show at the top of the empty state. Default is **CuReIcons.closeCircle** | ❌ |
| `iconChild` | `Widget` | Custom widget to show at the top of the empty state | ❌ |
| `title` | `String` | Empty state title | ❌ |
| `description` | `String` | Empty state description | ❌ |
| `child` | `Widget` | Custom widget to show at the end of the empty state | ❌ |
| `padding` | `EdgeInsets` | Empty state padding | ❌ |
