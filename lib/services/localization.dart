import 'dart:io';

class Localization {
  static final Map<String, Map<String, dynamic>> _localizedValues = {
    'en': {
      'skip': 'Skip',
      'next': 'Next',
      'finish': 'Finish',
      'back': 'Back',
      'field_number_error': 'This field must be a number',
      'field_email_error': 'Please insert a valid email address',
      'field_required_error': 'This field is required',
      'characters': 'characters',
      'field_min_chars_error': 'This field must have at least',
      'field_min_error': 'The number must be greater than',
      'field_max_chars_error': 'This field must not have more than',
      'field_max_error': 'The number must be lower than',
      'password_not_safe_error':
          'Password must contain at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character',
      'years_old': 'years old',
      'age_min_error': 'You must be at least',
      'age_max_error': 'You must be at most',
      'invalid_format_erorr': 'Invalid format',
      'email_address': 'Email address',
      'email_address_placeholder': 'john.doe@company.com',
      'password': 'Password',
      'password_placeholder': 'y0ur_S&cure_P@ssw0rd',
      'sign_in': 'Sign In',
      'sign_up': 'Sign Up',
      'or': 'or',
      'forgot_password': 'I forgot my password',
      'continue_with_google': 'Continue with Google',
      'continue_with_apple': 'Continue with Apple',
      'continue_with_facebook': 'Continue with Facebook',
      'continue_with_linkedin': 'Continue with LinkedIn',
      'dont_have_account': 'Don\'t have an account?',
      'typing': 'Typing...',
      'write_a_message': 'Write a message...',
      'select_a_picture': 'Select a picture',
      'camera': 'Camera',
      'gallery': 'Gallery',
      'field_no_spaces_error': 'This field must not contain spaces',
      'create_an_account': 'Create an account',
      'create_an_account_description': 'Create your account to get started',
      'first_name': 'First Name',
      'first_name_placeholder': 'John',
      'last_name': 'Last Name',
      'last_name_placeholder': 'Doe',
      'already_have_account': 'Already have an account?',
      'by_signing_up': 'By signing up you agree to our ',
      'terms_of_service': 'Terms of Service',
      'and_our': ' and our ',
      'privacy_policy': 'Privacy Policy',
      'invalid_email_address_error': 'Invalid email address',
      'email_not_confirmed_error':
          'We sent you an email to verify your account. Please check your inbox.',
      'check_your_email_spam': 'Also check your email spam folder.',
      'resend_confirmation_email': 'Resend confirmation email',
      'invalid_login_credentials_error':
          'Invalid email or password. Please try again.',
      'forgot_password_title': 'Forgot Password',
      'forgot_password_email':
          'Enter your email address to receive an email to reset your password',
      'forgot_password_submit': 'Send reset password email',
      'email_placeholder': 'Enter your email address',
      'select_an_option': 'Select an option',
      'cancel': 'Cancel',
      'buy_now': 'Buy Now',
      'by_clicking_buy': 'By clicking the buy button you agree to our ',
      'start_free_trial': 'Start Free Trial',
      'january': 'January',
      'february': 'February',
      'march': 'March',
      'april': 'April',
      'may': 'May',
      'june': 'June',
      'july': 'July',
      'august': 'August',
      'september': 'September',
      'october': 'October',
      'november': 'November',
      'december': 'December',
      'monday': 'Monday',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'thursday': 'Thursday',
      'friday': 'Friday',
      'saturday': 'Saturday',
      'sunday': 'Sunday',
      'close': 'Close',
      'empty_state_title': 'No items found',
      'empty_state_description':
          'Try adjusting your search or filter to find what you need.',
      'verify_email_title': 'Verify Email',
      'go_to_sign_in': 'Go to Sign In',
      'resend_email': 'Resend verification email',
      'email_resent':
          'We\'ve sent another verification email. Please check your inbox and your spam folder.',
      'survey_max_choices_reached':
          'You have reached the maximum number of choices',
    },
    'it': {
      'skip': 'Salta',
      'next': 'Avanti',
      'finish': 'Fine',
      'back': 'Indietro',
      'field_number_error': 'Questo campo deve essere un numero',
      'field_email_error': 'Inserisci un indirizzo email valido',
      'field_required_error': 'Questo campo è obbligatorio',
      'characters': 'caratteri',
      'field_min_chars_error': 'Questo campo deve avere almeno',
      'field_min_error': 'Il numero deve essere maggiore di',
      'field_max_chars_error': 'Questo campo non deve avere più di',
      'field_max_error': 'Il numero deve essere minore di',
      'password_not_safe_error':
          'La password deve contenere almeno 8 caratteri, 1 lettera maiuscola, 1 lettera minuscola, 1 numero e 1 carattere speciale',
      'years_old': 'anni',
      'age_min_error': 'Devi avere almeno',
      'age_max_error': 'Devi avere al massimo',
      'invalid_format_erorr': 'Formato non valido',
      'email_address': 'Indirizzo email',
      'email_address_placeholder': 'mario.rossi@provider.com',
      'password': 'Password',
      'password_placeholder': 'la_tua_P@ssw0rd_Sicura',
      'sign_in': 'Accedi',
      'sign_up': 'Registrati',
      'or': 'opppure',
      'forgot_password': 'Ho dimenticato la password',
      'continue_with_google': 'Continua con Google',
      'continue_with_apple': 'Continua con Apple',
      'continue_with_facebook': 'Continua con Facebook',
      'continue_with_linkedin': 'Continua con LinkedIn',
      'dont_have_account': 'Non hai un account?',
      'typing': 'Sta scrivendo...',
      'write_a_message': 'Scrivi un messaggio...',
      'select_a_picture': 'Seleziona una foto',
      'camera': 'Fotocamera',
      'gallery': 'Galleria',
      'field_no_spaces_error': 'Questo campo non deve contenere spazi',
      'create_an_account': 'Crea un account',
      'create_an_account_description': 'Crea il tuo account per iniziare',
      'first_name': 'Nome',
      'first_name_placeholder': 'Mario',
      'last_name': 'Cognome',
      'last_name_placeholder': 'Rossi',
      'already_have_account': 'Hai già un account?',
      'by_signing_up': 'Registrandoti accetti la nostra ',
      'terms_of_service': 'Termini di Servizio (EULA)',
      'and_our': 'e i nostri',
      'privacy_policy': 'Politica sulla Privacy',
      'invalid_email_address_error': 'Indirizzo email non valido',
      'email_not_confirmed_error':
          "Ti abbiamo inviato un'email per verificare il tuo account. Controlla la tua casella di posta.",
      'check_your_email_spam':
          'Controlla anche la cartella spam della tua email.',
      'resend_confirmation_email': 'Invia di nuovo',
      'invalid_login_credentials_error':
          'Credenziali di accesso non valide. Riprova.',
      'forgot_password_title': 'Password dimenticata',
      'forgot_password_email':
          'Inserisci il tuo indirizzo email per ricevere un\'email per reimpostare la password',
      'forgot_password_submit': 'Invia email',
      'email_placeholder': 'Inserisci il tuo indirizzo email',
      'select_an_option': 'Seleziona un\'opzione',
      'cancel': 'Annulla',
      'buy_now': 'Acquista Ora',
      'by_clicking_buy': 'Cliccando sul pulsante acquista accetti la nostra ',
      'start_free_trial': 'Inizia la prova gratuita',
      'january': 'Gennaio',
      'february': 'Febbraio',
      'march': 'Marzo',
      'april': 'Aprile',
      'may': 'Maggio',
      'june': 'Giugno',
      'july': 'Luglio',
      'august': 'Agosto',
      'september': 'Settembre',
      'october': 'Ottobre',
      'november': 'Novembre',
      'december': 'Dicembre',
      'lunedì': 'Lunedì',
      'martedì': 'Martedì',
      'mercoledì': 'Mercoledì',
      'giovedì': 'Giovedì',
      'venerdì': 'Venerdì',
      'sabato': 'Sabato',
      'domenica': 'Domenica',
      'close': 'Chiudi',
      'empty_state_title': 'Nessun elemento trovato',
      'empty_state_description':
          'Prova ad adattare la tua ricerca o filtro per trovare ciò di cui hai bisogno.',
      'verify_email': 'Verifica Email',
      'go_to_sign_in': 'Vai alla pagina di accesso',
      'resend_email': 'Invia di nuovo l\'email di verifica',
      'email_resent':
          'Abbiamo inviato un\'altra email di verifica. Controlla la tua casella di posta e la cartella spam.',
      'survey_max_choices_reached': 'Hai raggiunto il numero massimo di scelte.'
    },
    /*
    'es': {
      'skip': 'Saltar',
      'next': 'Siguiente',
      'finish': 'Finalizar',
      'back': 'Atrás',
      'field_number_error': 'Este campo debe ser un número',
      'field_email_error':
          'Por favor, introduce una dirección de correo electrónico válida',
      'field_required_error': 'Este campo es obligatorio',
      'characters': 'caracteres',
      'field_min_chars_error': 'Este campo debe tener al menos',
      'field_min_error': 'El número debe ser mayor que',
      'field_max_chars_error': 'Este campo no debe tener más de',
      'field_max_error': 'El número debe ser menor que',
      'password_not_safe_error':
          'La contraseña debe contener al menos 8 caracteres, 1 letra mayúscula, 1 letra minúscula, 1 número y 1 carácter especial',
      'years_old': 'años',
      'age_min_error': 'Debes tener al menos',
      'age_max_error': 'Debes tener como máximo',
      'invalid_format_erorr': 'Formato inválido',
      'email_address': 'Dirección de correo electrónico',
      'email_address_placeholder': 'john.doe@company.com',
      'password': 'Contraseña',
      'password_placeholder': 'y0ur_S&cure_P@ssw0rd',
      'sign_in': 'Iniciar sesión',
      'sign_up': 'Registrarse',
      'or': 'o',
      'forgot_password': 'Olvidé mi contraseña',
      'continue_with_google': 'Continuar con Google',
      'continue_with_apple': 'Continuar con Apple',
      'continue_with_facebook': 'Continuar con Facebook',
      'continue_with_linkedin': 'Continuar con LinkedIn',
      'dont_have_account': '¿No tienes una cuenta?',
      'typing': 'Escribiendo...',
      'write_a_message': 'Escribe un mensaje...',
      'select_a_picture': 'Seleccionar una imagen',
      'camera': 'Cámara',
      'gallery': 'Galería',
      'field_no_spaces_error': 'Este campo no debe contener espacios',
      'create_an_account': 'Crear una cuenta',
      'create_an_account_description': 'Crea tu cuenta para comenzar',
      'first_name': 'Nombre',
      'first_name_placeholder': 'John',
      'last_name': 'Apellido',
      'last_name_placeholder': 'Doe',
      'already_have_account': '¿Ya tienes una cuenta?',
      'by_signing_up': 'Al registrarte aceptas nuestros ',
      'terms_of_service': 'Términos de servicio',
      'and_our': ' y nuestra ',
      'privacy_policy': 'Política de privacidad',
      'invalid_email_address_error': 'Dirección de correo electrónico inválida',
      'email_not_confirmed_error':
          'Te enviamos un correo electrónico para verificar tu cuenta. Por favor, revisa tu bandeja de entrada.',
      'check_your_email_spam': 'Revisa también la carpeta de spam.',
      'resend_confirmation_email': 'Reenviar correo de confirmación',
      'invalid_login_credentials_error':
          'Correo electrónico o contraseña incorrectos. Inténtalo de nuevo.',
      'forgot_password_title': 'Contraseña olvidada',
      'forgot_password_email':
          'Introduce tu dirección de correo electrónico para recibir un correo para restablecer tu contraseña',
      'forgot_password_submit': 'Enviar correo para restablecer la contraseña',
      'email_placeholder': 'Introduce tu dirección de correo electrónico',
      'select_an_option': 'Selecciona una opción',
      'cancel': 'Cancelar',
      'buy_now': 'Comprar ahora',
      'by_clicking_buy':
          'Al hacer clic en el botón de compra aceptas nuestros ',
      'start_free_trial': 'Iniciar prueba gratuita',
      'january': 'Enero',
      'february': 'Febrero',
      'march': 'Marzo',
      'april': 'Abril',
      'may': 'Mayo',
      'june': 'Junio',
      'july': 'Julio',
      'august': 'Agosto',
      'september': 'Septiembre',
      'october': 'Octubre',
      'november': 'Noviembre',
      'december': 'Diciembre',
      'monday': 'Lunes',
      'tuesday': 'Martes',
      'wednesday': 'Miércoles',
      'thursday': 'Jueves',
      'friday': 'Viernes',
      'saturday': 'Sábado',
      'sunday': 'Domingo',
      'close': 'Cerrar',
      'empty_state_title': 'No se encontraron elementos',
      'empty_state_description':
          'Intenta ajustar tu búsqueda o filtro para encontrar lo que necesitas.',
      'verify_email_title': 'Verificar correo electrónico',
      'go_to_sign_in': 'Ir a iniciar sesión',
      'resend_email': 'Reenviar correo de verificación',
      'email_resent':
          'Hemos enviado otro correo de verificación. Por favor, revisa tu bandeja de entrada y la carpeta de spam.',
      'survey_max_choices_reached': 'Has alcanzado el número máximo de opciones'
    }
    */
  };

  static void setValues(Map<String, Map<String, dynamic>> values) {
    values.forEach((language, translations) {
      if (_localizedValues[language] == null) {
        _localizedValues[language] = {};
      }
      _localizedValues[language]!.addAll(translations);
    });
  }

  static String? locale;

  static String getValue(String key) {
    String language = Localization.locale ?? 'en';
    if (key.contains('.')) {
      final parts = key.split('.');
      dynamic localizedValue = _localizedValues[language];
      if (localizedValue == null) {
        Localization.locale = 'en';
        return getValue(key);
      }
      for (var part in parts) {
        if (localizedValue is Map<String, dynamic>) {
          localizedValue = localizedValue[part];
        } else if (localizedValue is String) {
          return localizedValue;
        } else {
          return _localizedValues['en']?[key] ?? 'Key not found';
        }
      }
      if (localizedValue is String) {
        return localizedValue;
      } else {
        return _localizedValues['en']?[key] ?? 'Key not found';
      }
    } else {
      return _localizedValues[language]?[key] ??
          _localizedValues['en']?[key] ??
          'Key not found';
    }
  }
}

class CuReLocalization {
  static void setLanguage(String locale) {
    Localization.locale = locale;
  }

  static String get(String key) {
    return Localization.getValue(key);
  }

  static void setValues(Map<String, Map<String, dynamic>> values) {
    Localization.setValues(values);
  }

  static String getSystemLanguage({String fallbackLanguage = 'en'}) {
    try {
      return Platform.localeName.split('_')[0];
    } catch (e) {
      return fallbackLanguage;
    }
  }

  static void useSystemLanguage({String fallbackLanguage = 'en'}) {
    try {
      Localization.locale = Platform.localeName.split('_')[0];
    } catch (e) {
      Localization.locale = fallbackLanguage;
    }
  }
}
