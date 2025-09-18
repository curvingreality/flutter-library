# Localization

---

## Set language

This method is used to set the preferred language.

```dart
CuReLocalization.setLanguage('en');
```

## Use system language

This method is used to automatically set the language based on the system language in use.<br>
The default fallback language is **English (en)**, but you can specify a fallback language by passing it as a parameter.

```dart
CuReLocalization.useSystemLanguage();
CuReLocalization.useSystemLanguage('it'); // Fallback language
```

## Set values

To specify the labels for your language you can call this method in your **main.dart**.

```dart
// Example of defining custom labels
CuReLocalization.setValues({
    'en': {
        'common': {'close': 'Close'},
        'screens': {
            'welcome': {'finish_button': 'Inizia ora'},
        }
    },
    'it': {
        'common': {'close': 'Chiudi'},
        'screens': {
            'welcome': {'finish_button': 'Start now'},
        }
    },
});
```

## Get value

With this method you can get the localized value.

```dart
CuReLocalization.get('common.close');

// Example in a text widget
CuReText(
    CuReLocalization.get('common.close')
);
```
