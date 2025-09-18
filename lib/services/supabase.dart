import 'dart:convert';

import 'package:curving_reality_library/curving_reality_library.dart';
import 'package:curving_reality_library/models/supabase.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';

class CuReSupabaseService {
  initialize({
    required String url,
    required String anonKey,
  }) async {
    await Supabase.initialize(url: url, anonKey: anonKey);
  }

  Future<CuReSupabaseAuthResponse> createAccountWithEmailAndPassword(
    String email,
    String password,
    Map<String, dynamic> data,
  ) async {
    try {
      final supabase = Supabase.instance.client;
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: data,
      );
      final Session? session = res.session;
      final User? user = res.user;
      return CuReSupabaseAuthResponse(
        user: user,
        session: session,
        error: null,
      );
    } catch (e) {
      // ignore: avoid_print
      print('[Supabase CuRe Auth] Exception during account creation: $e');
      return CuReSupabaseAuthResponse(
        user: null,
        session: null,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<bool> resendConfirmationEmail(String email) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.auth.resend(
        type: OtpType.signup,
        email: email,
      );
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(
          '[Supabase CuRe Auth] Exception during resend confirmation email: $e');
      return false;
    }
  }

  Future<CuReSupabaseAuthResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final supabase = Supabase.instance.client;
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final Session? session = res.session;
      final User? user = res.user;
      return CuReSupabaseAuthResponse(
        user: user,
        session: session,
        error: null,
      );
    } catch (e) {
      // ignore: avoid_print
      print('[Supabase CuRe Auth] Exception during sign in: $e');
      return CuReSupabaseAuthResponse(
        user: null,
        session: null,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<CuReSupabaseAuthResponse> signInWithApple(
      [Map<String, dynamic>? userMetadata]) async {
    try {
      final supabase = Supabase.instance.client;
      final rawNonce = supabase.auth.generateRawNonce();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        // ignore: avoid_print
        print(
            '[Supabase CuRe Auth] Could not find ID Token from generated credential.');
        return CuReSupabaseAuthResponse(
          user: null,
          session: null,
          error: 'Could not find ID Token from generated credential.',
        );
      }

      final result = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );

      // Update user metadata if provided
      if (result.user != null && userMetadata != null) {
        await supabase.auth.updateUser(
          UserAttributes(
            data: userMetadata,
          ),
        );
      }

      return CuReSupabaseAuthResponse(
        user: result.user,
        session: result.session,
        error: null,
      );
    } catch (e) {
      // ignore: avoid_print
      print('[Supabase CuRe Auth] Exception during Apple sign in: $e');
      return CuReSupabaseAuthResponse(
        user: null,
        session: null,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<CuReSupabaseAuthResponse> signInWithGoogle(String webClientId,
      [Map<String, dynamic>? userMetadata]) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      final supabase = Supabase.instance.client;

      if (accessToken == null) {
        throw '[Supabase CuRe Auth] Could not find access token from Google sign in.';
      }
      if (idToken == null) {
        throw '[Supabase CuRe Auth] Could not find ID token from Google sign in.';
      }

      final result = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      // Update user metadata if provided
      if (result.user != null && userMetadata != null) {
        await supabase.auth.updateUser(
          UserAttributes(
            data: userMetadata,
          ),
        );
      }

      return CuReSupabaseAuthResponse(
        user: result.user,
        session: result.session,
        error: null,
      );
    } catch (e) {
      // ignore: avoid_print
      print('[Supabase CuRe Auth] Exception during Google sign in: $e');
      return CuReSupabaseAuthResponse(
        user: null,
        session: null,
        error: _getErrorMessage(e),
      );
    }
  }

  Future<void> resetPasswordForEmail(String email, String redirectTo) async {
    try {
      final supabase = Supabase.instance.client;
      supabase.auth.resetPasswordForEmail(email, redirectTo: redirectTo);
    } catch (e) {
      // ignore: avoid_print
      print('[Supabase CuRe Auth] Exception during password reset: $e');
    }
  }

  Future<void> signOut() async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print('[Supabase CuRe Auth] Exception during logout: $e');
    }
  }

  _getErrorMessage(dynamic error) {
    switch (error.code) {
      case 'email_address_invalid':
        return CuReLocalization.get('invalid_email_address_error');
      case 'email_not_confirmed':
        return CuReLocalization.get('email_not_confirmed_error');
      case 'invalid_credentials':
        return CuReLocalization.get('invalid_login_credentials_error');
    }
    return error.message ?? 'Unknown error';
  }
}
