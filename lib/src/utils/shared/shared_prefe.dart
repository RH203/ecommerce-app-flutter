// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String KEY_ACCESS = "EXPIRES_AT";

  Future<void> setExpiredToken(int token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(KEY_ACCESS, token);
  }

  Future<int> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(KEY_ACCESS) ??
        DateTime.now().millisecondsSinceEpoch + 1;
  }
}
