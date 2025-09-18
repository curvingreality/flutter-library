# Paywall Screen

---

A **ready-to-use**, fully animated and high customizable screen to use to sell a service to the user.<br>
Try it in the [interactive example](/#/example) under the **screens** section.

!> This and all the screens depend on the package [animate_do](https://pub.dev/packages/animate_do).

## Example

```dart
CuRePaywallScreen(
    background: Image.asset(
        'assets/images/background.png',
    ),
    logo: Image.asset('assets/images/logo-icon-dark.png', width: 100, height: 100, fit: BoxFit.cover),
    onClose: () {
        Navigator.of(context).pop();
        // Do something
    },
    title: 'Premium',
    description: 'Unlock our unique premium features',
    items: [
        CuRePaywallItem(
            icon: CuReIcons.airplane,
            title: 'Offline mode',
            description:
                'Enjoy offline access to your favorite content',
            color: CuReDesign.infoColor,
        ),
        CuRePaywallItem(
            icon: Icons.coffee,
            title: 'No ads',
            description:
                'Enjoy an ad-free experience while using the app',
            color: CuReDesign.successColor,
        ),
    ],
    prices: [
        CuRePaywallPrice(
            duration: 'month',
            price: 4.99,
            id: 1,
            title: 'Monthly',
        ),
        CuRePaywallPrice(
            duration: 'year',
            price: 49.99,
            id: 2,
            title: 'Yearly',
            discount: '15% OFF',
        ),
        CuRePaywallPrice(
            duration: 'forever',
            price: 69.99,
            id: 3,
            title: 'Lifetime',
            discount: 'BEST DEAL',
        ),
    ],
    trialText: '7 days free trial',
    privacyPolicyUrl: 'https://www...',
    termsOfServiceUrl: 'https://www...',
    onBuy: (selectedItem) {
        // Do something
    },
);
```

## Properties

| Property            | Type                     | Description                                                                                                | Mandatory |
| ------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------- | --------- |
| `title`             | `String`                 | The title to show at the top of the screen                                                                 | ✅        |
| `description`       | `String`                 | The description to show at the top of the screen under the title                                           | ✅        |
| `items`             | `List<CuRePaywallItem>`  | The list of the things the user unlocks buying the subscription                                            | ✅        |
| `prices`            | `List<CuRePaywallPrice>` | The list of the items that the user can buy and their prices                                               | ✅        |
| `onBuy`             | `Function(int)`          | Emitted when the user taps on the **Buy Now** button. It returns the selected item id                      | ✅        |
| `onClose`           | `Function(void)`         | Emitted when the user taps on the close button                                                             | ❌        |
| `termsOfServiceUrl` | `String`                 | URL set that shows a disclaimer at the bottom of the screen with a link                                    | ❌        |
| `privacyPolicyUrl`  | `String`                 | URL set that shows a disclaimer at the bottom of the screen with a link                                    | ❌        |
| `trialText`         | `String`                 | If set it shows the trial text label and changes the button label from **Buy Now** to **Start free trial** | ❌        |
| `logo`              | `Widget`                 | Custom widget shown as logo at the top of the screen                                                       | ❌        |
| `background`        | `Image`                  | Adds a custom image background at the top of the screen                                                    | ❌        |
