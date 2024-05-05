// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String KEY_ACCESS = "ACCESS_TOKEN";

  Future<void> setAccessToken(bool token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(KEY_ACCESS, token);
  }

  Future<bool> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(KEY_ACCESS) ?? false;
  }
}
