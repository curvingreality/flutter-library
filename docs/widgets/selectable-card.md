# Selectable Card

---

## Example

```dart
int? selectedCard;

Column(
    children: [
        CuReSelectableCard(
            title: 'Selectable Card',
            description: 'Tap to select this card.',
            icon: CuReIcons.info,
            selected: selectedCard == 1,
            onPressed: () {
                setState(() {
                    selectedCard = 1;
                });
            },
        ),
        CuReSpacing.vertical(),
        CuReSelectableCard(
            title: 'Selectable Card',
            description: 'Tap to select this card.',
            icon: CuReIcons.heart,
            color: CuReDesign.successColor,
            selected: selectedCard == 2,
            onPressed: () {
                setState(() {
                    selectedCard = 2;
                });
            },
        ),
    ],
);
```

## Properties
| Property | Type | Description | Mandatory |
| --------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `child` | `Widget` | Custom widget to show inside the card | ❌ |
| `title` | `String` | Card title | ❌ |
| `description` | `String` | Card description | ❌ |
| `icon` | `Icon` | It shows an icon on the top inside the card | ❌ |
| `color` | `Color` | Custom card background color | ❌ |
| `onPressed` | `Function(void)` | Emits an event when the user taps on the card | ❌ |
| `shape` | `CuReShape` | Shape of the card. Regular, rounded, squared. Default is the **CuReDesign.defaultElementsShape** (regular) | ❌ |
| `selected` | `bool` | Status of the card | ❌ |
