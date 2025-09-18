import 'package:shared_preferences/shared_preferences.dart';

class CuReStorage {
  static Future<String?> get(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    if (value == null) {
      // ignore: avoid_print
      print('[CuRe Storage] Key not found: $key');
    }
    return value;
  }

  static Future<void> save(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
