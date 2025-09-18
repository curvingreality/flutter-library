import 'package:supabase_flutter/supabase_flutter.dart';

class CuReSupabaseAuthResponse {
  final User? user;
  final Session? session;
  final String? error;

  CuReSupabaseAuthResponse(
      {required this.user, required this.session, required this.error});
}
