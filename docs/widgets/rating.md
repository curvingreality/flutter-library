# Rating

---

## Example

```dart
int rating = 2;

CuReRating(
    rating: rating,
    max: 6,
    onTap: (rating) {
        setState(() {
            rating1 = rating;
        });
    },
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `rating` | `int` | The value of the rating | ✅ |
| `max` | `int` | Maximum rating. Default is 5 | ❌ |
| `icon` | `IconData` | The icon to show as rating. Default is **CuReIcons.star** | ❌ |
| `color` | `Color` | The rating color. Default is **Colors.yellow.shade600** | ❌ |
| `disabled` | `bool` | If set to true the user can't change the rating | ❌ |
| `onTap` | `Function(int)` | Emits an event when the user changes the rating. Returns the current rating | ❌ |
| `size` | `double` | Icon size. Default is 30 | ❌ |
