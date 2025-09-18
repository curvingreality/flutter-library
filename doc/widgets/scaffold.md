# Scaffold

---

It replaces the default **Scaffold** widget in order to implement custom logic and different UI based on the OS.

## Example

```dart
CuReScaffold(
    body: Center(child: CuReText('Hello world')),
    safeArea: true,
)
```

## Properties

| Property                       | Type                           | Description                                                                                                                                                                             | Mandatory |
| ------------------------------ | ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| `appBar`                       | [CuReAppBar](widgets/app-bar)  | Replaces the default **AppBar** in order to implement custom logic and different UI based on the OS.                                                                                    | ❌        |
| `body`                         | `Widget`                       | Custom content to show as screen body                                                                                                                                                   | ❌        |
| `resizeToAvoidBottomInset`     | `bool`                         | Standard behaviour as the default **Scaffold** Flutter widget                                                                                                                           | ❌        |
| `bottomNavigationBar`          | `BottomNavigationBar`          | Default **BottomNavigationBar** Flutter widget                                                                                                                                          | ❌        |
| `extendedBody`                 | `bool`                         | Standard behaviour as the default **Scaffold** Flutter widget                                                                                                                           | ❌        |
| `floatingActionButtonLocation` | `FloatingActionButtonLocation` | Standard behaviour as the default **Scaffold** Flutter widget                                                                                                                           | ❌        |
| `floatingActionButton`         | `Widget`                       | Standard behaviour as the default **Scaffold** Flutter widget                                                                                                                           | ❌        |
| `backgroundColor`              | `Color`                        | Standard behaviour as the default **Scaffold** Flutter widget. If not specified it will be used the **CuReDesign dark color** if in dark mode, otherwise the **CuReDesign white color** | ❌        |
| `safeArea`                     | `bool`                         | If set to true it incapsulates the **body** inside a **SafeArea** widget                                                                                                                | ❌        |
