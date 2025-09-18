# Notifications

---

The **CuReNotifications** service shows beautifully designed notifications inside the current screen.

## Set Up

In order to use this service you need to set the **CuReNotifications key** to a **CuReScaffold**.

```dart
CuReScaffold(
    key: CuReNotifications.key,
    body: Center(
        child: CuReButton(
            label: 'Try now!',
            onPressed: () {
                showNotification();
            }
        )
    )
)

void showNotification() {
    CuReNotifications.show('Hello!');
}
```

!> Remember that the **key** must be unique for every scaffold.

## Set a new key

```dart
CuReNotifications.generateKey();
```

## Queue

The **notifications service** has an internal queue, so if there are multiple notifications they will appear one after the another, waiting for the previous one to finish.

## Parameters

You can customize the notification with the params of the **LocalNotification** class.

| Property      | Type                    | Description                                                                                                                                                   | Nullable |
| ------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| `id`          | `int`                   | Integer used for logic operations if you need to know which notification has been pressed                                                                     | ✅       |
| `color`       | `Color`                 | Changes the background of the notification. Default is the **info** color                                                                                     | ✅       |
| `icon`        | `IconData`              | Shows an icon at the left of the notification. Default is the **info** icon                                                                                   | ✅       |
| `title`       | `String`                | Notification title                                                                                                                                            | ✅       |
| `description` | `String`                | Notification description                                                                                                                                      | ✅       |
| `child`       | `Widget`                | Custom widget that you can use to customize the notification as you want                                                                                      | ✅       |
| `duration`    | `Duration`              | Specifies for how long the notification needs to be shown                                                                                                     | ✅       |
| `onTap`       | `Function(void)`        | Emits an event when the notification has been tapped                                                                                                          | ✅       |
| `type`        | `LocalNotificationType` | Enum used to speed up the development. If used it will be applied an icon and a color based on the type. Available types: **info, succcess, warning, danger** | ✅       |
