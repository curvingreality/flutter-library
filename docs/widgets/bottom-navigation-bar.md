# Bottom Navigation Bar

---

<div class="smartphone-container">
    <iframe src="https://www.curvingreality.com/projects/flutter-library/?screen=bottom-navigation-bar" class="iframe-device" style="min-height: 370px; height: 370px !important;"></iframe>
</div>

## Example

```dart
int currentScreenIndex = 0;

CuReBottomNavigationBar(
    onTap: (index) {
        setState(() {
            ßcurrentScreenIndex = index;
        });
    },
    currentIndex: currentScreenIndex,
    items: [
        CuReBottomNavigationBarItem(
            icon: CuReIcons.home,
            label: 'Home',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.deviceMobile,
            label: 'Screens',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.list,
            label: 'Forms',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.starOutlined,
            label: 'Miscellaneous',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.downloadOutlined,
            label: 'Buttons',
        ),
    ],
);
```

## Vertical layout

By default the bottom navigation bar uses an **horizontal layout**.

```dart
int currentScreenIndex = 0;

CuReBottomNavigationBar(
    onTap: (index) {
        setState(() {
            ßcurrentScreenIndex = index;
        });
    },
    horizontalLayout: false, // Sets the layout to vertical
    currentIndex: currentScreenIndex,
    items: [
        CuReBottomNavigationBarItem(
            icon: CuReIcons.home,
            label: 'Home',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.deviceMobile,
            label: 'Screens',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.list,
            label: 'Forms',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.starOutlined,
            label: 'Miscellaneous',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.downloadOutlined,
            label: 'Buttons',
        ),
    ],
);
```

## Custom icons

You can change the single items properties in order to use custom icons and colors.

```dart
int currentScreenIndex = 0;

CuReBottomNavigationBar(
    onTap: (index) {
        setState(() {
            ßcurrentScreenIndex = index;
        });
    },
    currentIndex: currentScreenIndex,
    items: [
        CuReBottomNavigationBarItem(
            label: 'Home',
            widgetIcon: Icon(Icons.abc_rounded, size: 12, color: CuReDesign.whiteColor), // Custom icon
            activeWidgetIcon: Icon(Icons.abc, size: 12, color: CuReDesign.whiteColor), // Custom selected item icon
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.deviceMobile,
            label: 'Screens',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.list,
            label: 'Forms',
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.starOutlined,
            label: 'Miscellaneous',
            color: Colors.blue, // Changes the single item color
        ),
        CuReBottomNavigationBarItem(
            icon: CuReIcons.downloadOutlined,
            label: 'Buttons',
            activeIcon: CuReIcons.download, // It shows when the item is selected
        ),
    ],
);
```

## Properties

| Property              | Type                                | Description                                                                                | Mandatory |
| --------------------- | ----------------------------------- | ------------------------------------------------------------------------------------------ | --------- |
| `items`               | `List<CuReBottomNavigationBarItem>` | List of items to show                                                                      | ✅        |
| `currentIndex`        | `int`                               | The selected item index                                                                    | ✅        |
| `onTap`               | `Function(int)`                     | Emits an event when the user taps on an item. Returns the index                            | ❌        |
| `backgroundColor`     | `Color`                             | Changes the default bottom bar background color                                            | ❌        |
| `selectedColor`       | `Color`                             | Specifies the item selected color (both icon and label)                                    | ❌        |
| `unselectedColor`     | `Color`                             | Specifies the unselected items color (both icon and label)                                 | ❌        |
| `showUnselectedLabel` | `bool`                              | If **true** it shows every items label                                                     | ❌        |
| `showSelectedLabel`   | `bool`                              | If set to **true** shows the selected item label (default is **true** on horizontalLayout) | ❌        |
| `horizontalLayout`    | `bool`                              | If set to **false** the layout becomes vertical or icon only                               | ❌        |
| `shape`               | `CuReShape`                         | Shape of the items. Default is **CuReShape.rounded**                                       | ❌        |
| `labelSize`           | `double`                            | Set the size of all labels                                                                 | ❌        |
