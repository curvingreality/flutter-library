# Cached Network Image

---

It displays an image from a URL, and save it on the system cache, in order to not load data from the network the next time.

## Example

```dart
CuReCachedNetworkImage(
    url: 'https://ui-avatars.com/api/?name=John+Doe&format=png',
    fit: BoxFit.cover,
    placeholder: const SizedBox(
        child: CuReCircularProgressIndicator(
        size: CuReProgressIndicatorSize.small,
        ),
    ),
    errorWidget: const Icon(
        Icons.error,
    ),
);
```

## Properties
| Property | Type | Description | Mandatory |
|----------|-------|-------------|-----------|
| `url` | `String` | The URL of the image to display | ✅ |
| `fit` | `BoxFit?` | How the image should be inscribed into the space allocated | ❌ |
| `width` | `double?` | The width of the image | ❌ |
| `height` | `double?` | The height of the image | ❌ |
| `color` | `Color?` | A color to blend with the image | ❌ |
| `repeat` | `ImageRepeat?` | Defines how the image should be tiled (repeated) | ❌ |
| `alignment` | `AlignmentGeometry?` | How the image should be aligned within its bounds | ❌ |
| `placeholder` | `Widget?` | Widget to display while the image is loading | ❌ |
| `errorWidget` | `Widget?` | Widget to display if the image fails to load | ❌ |
