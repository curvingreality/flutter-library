# Dropdown

---

## Example

```dart
final List<CuReDropdownItem> dropdownItems = [
    CuReDropdownItem(
        value: 'option1',
        label: 'Option 1',
        icon: CuReIcons.celebration,
    ),
    CuReDropdownItem(
        value: 'option2',
        label: 'Option 2',
        icon: CuReIcons.settings,
    ),
    CuReDropdownItem(
        value: 'option3',
        label: 'Option 3',
        icon: CuReIcons.delete,
        color: CuReDesign.dangerColor,
    ),
];
int selectedDropdownIndex = 0;

CuReDropdown(
    items: dropdownItems,
    selectedIndex: selectedDropdownIndex,
    onChanged: (value) {
        setState(() {
            selectedDropdownIndex = dropdownItems.indexWhere(
                (item) => item.value == value.value,
            );
        });
    },
):
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `items` | `List<CuReDropdownItem>` | Items list | ✅ |
| `onChanged` | `ValueChanged(CuReDropdownItem)` | Emits an event when the user selects a dropdown item | ✅ |
| `selectedIndex` | `int` | Selected value index | ❌ |
| `icon` | `Icon` | Custom icon on the right of the dropdown. Default is **CuReIcons.chevronDown** | ❌ |
| `color` | `Color` | Custom color for border, background, icon and text | ❌ |
| `showSelectedItem` | `bool` | Default is true. If set to false it doesn't show the selected item when the dropdown is closed | ❌ |
| `title` | `String` | Label to show at the top of the items list | ❌ |
| `disabled` | `bool` | If set to true the user can't open the dropdown | ❌ |
| `solid` | `bool` | If set to true the dropdown shows the background | ❌ |
| `showBorder` | `bool` | If set to true the dropdown shows the borders | ❌ |
| `dropdownWidth` | `double` | Custom dropdown width. Default is 200 | ❌ |
| `dropdownMaxHeight` | `double` | Custom dropdown max height. Default is 260 | ❌ |
| `preferDirection` | `DropdownDirection` | Choose where the dropdown items appear. Default is **auto** | ❌ |
| `context` | `BuildContext` | Custom BuildContext to open the dropdown in | ❌ |
