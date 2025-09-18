# Supabase

---

!> This service depends on the packages [supabase_flutter](https://pub.dev/packages/supabase_flutter) and [crypto](https://pub.dev/packages/crypto) and their configurations

## Response

The service methods respond with a **CuReSupabaseAuthResponse** class that provides these properties:

| Property  | Type      | Description                                                                     | Nullable |
| --------- | --------- | ------------------------------------------------------------------------------- | -------- |
| `error`   | `String`  | Localized error text (if present), or the Supabase error                        | ✅       |
| `session` | `Session` | Supabase session                                                                | ✅       |
| `user`    | `User`    | Supabase user. If this property is set it means that the sign in is successfull | ✅       |

## Sign Up with email and password

You can provide the third parameter **data** in order to save custom user data.

```dart
final supabaseService = CuReSupabaseService();
final response = await supabaseService.createAccountWithEmailAndPassword('johndoe@gmail.com', 'my_password', {'firstName': 'John', 'lastName': 'Doe'});
```

## Resend confirmation email

```dart
final supabaseService = CuReSupabaseService();
final response = await supabaseService.resendConfirmationEmail('johndoe@gmail.com');
```

## Reset password for email

Provide the email to send the reset link and where the user should be redirect.

```dart
final supabaseService = CuReSupabaseService();
final response = await supabaseService.resetPasswordForEmail('johndoe@gmail.com', 'REDIRECT_URL');
```

## Sign In with email and password

```dart
final supabaseService = CuReSupabaseService();
await supabaseService.signInWithEmailAndPassword('johndoe@gmail.com', 'my_password');
```

## Sign In with Apple

Used to Sign Up/Sign In with an Apple account. You just need to provide the custom user data.

!> This method depends on the [sign_in_with_apple](https://pub.dev/packages/sign_in_with_apple) package and its configuration.

```dart
final supabaseService = CuReSupabaseService();
final response = await supabaseService.signInWithApple({'firstName': 'John', 'lastName': 'Doe'});
```

## Sign In with Google

Used to Sign Up/Sign In with a Google account. You need to provide the **Web Client ID**.

!> This method depends on the [google_sign_in](https://pub.dev/packages/google_sign_in) package and its configuration.

```dart
final supabaseService = CuReSupabaseService();
final response = await supabaseService.signInWithGoogle('WEB_CLIENT_ID', {'firstName': 'John', 'lastName': 'Doe'});
```

## Sign Out

```dart
final supabaseService = CuReSupabaseService();
await supabaseService.signOut();
```
