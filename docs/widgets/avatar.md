# Avatar

---

# Example

```dart
CuReAvatar(
    notifications: 3,
    url: 'https://ui-avatars.com/api/?name=John+Doe&format=png',
    size: CuReAvatarSize.large,
    isOnline: true,
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `url` | `String` | If set it shows the network image from the URL | ❌ |
| `path` | `String` | If set it shows the local image of the path | ❌ |
| `shape` | `CuReShape` | Regular, rounded, squared. Default is rounded | ❌ |
| `size` | `CuReAvatarSize` | Small, medium, large, biggest. Default is medium | ❌ |
| `color` | `Color` | The image color | ❌ |
| `border` | `Border` | Defines the border to show around the avatar | ❌ |
| `child` | `Widget` | Use this property to add a custom widget in the Avatar space with a Positioned | ❌ |
| `shadow` | `BoxShadow` | Shadow to show around the avatar | ❌ |
| `widthHeight` | `double` | Custom width and height size. If set it replaces the **size** property | ❌ |
| `isOnline` | `bool` | If set to true shows a green circle on the bottom left of the avatar | ❌ |
| `notifications` | `double` | If set it shows the number of notifications in a red circle on the top right of the avatar | ❌ |
