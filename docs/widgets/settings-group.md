# Settings Group

---

## Example

```dart
CuReSettingsGroup(
    title: 'Theme settings',
    items: [
        CuReSettingsItem(
            description: 'Dark mode',
            icon: Icons.dark_mode,
            child: CuReSwitch(
                checked: CuReDesign.useDarkMode,
                onChanged: (value) {
                    setState(() {
                        CuReDesign.useDarkMode = value;
                    });
                },
            ),
        ),
        CuReSettingsItem(
            description: 'Light mode',
            icon: Icons.light_mode,
            child: CuReSwitch(
            checked: !CuReDesign.useDarkMode,
                onChanged: (value) {
                    setState(() {
                        CuReDesign.useDarkMode = !value;
                    });
                },
            ),
        ),
    ],
):
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `items` | `List<CuReSettingsItem>` | Settings items list | ✅ |
| `title` | `String` | If set it shows a label on the top of the group | ❌ |
| `titleChild` | `Widget` | If set it shows the custom widget on the top of the group | ❌ |
