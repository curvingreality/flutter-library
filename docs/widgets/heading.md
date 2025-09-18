# Heading

---

It shows a bigger and bolder text by default.

## Example

```dart
CuReHeading('Hello world', color: Colors.red);
```

## Properties

| Property        | Type             | Description                                                                                                                         | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `color`         | `Color`          | Custom text color. Default one is the **CuReDesign text color** if dark mode is active, and **CuReDesign white color** if it is not | ❌        |
| `align`         | `TextAlign`      | Text alignment                                                                                                                      | ❌        |
| `maxLines`      | `int`            | How many max lines the text can reach                                                                                               | ❌        |
| `size`          | `double`         | Text size. Default is 26                                                                                                            | ❌        |
| `lineHeight`    | `double`         | Text line height. Default is 1.7                                                                                                    | ❌        |
| `shadows`       | `List<Shadow>`   | List of shadows to apply to the text                                                                                                | ❌        |
| `weight`        | `FontWeight`     | Text weight. Default is FontWeight.w600                                                                                             | ❌        |
| `padding`       | `EdgeInsets`     | Custom padding to apply around the text                                                                                             | ❌        |
| `letterSpacing` | `double`         | Space between letters                                                                                                               | ❌        |
| `fontFamily`    | `String`         | Custom font family                                                                                                                  | ❌        |
| `decoration`    | `TextDecoration` | Custom text decoration                                                                                                              | ❌        |
| `overflow`      | `TextOverflow`   | Text overflow                                                                                                                       | ❌        |
