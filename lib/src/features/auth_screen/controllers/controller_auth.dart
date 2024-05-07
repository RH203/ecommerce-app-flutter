// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:ecommerce_app/src/utils/provider/user_provider.dart';
import 'package:ecommerce_app/src/utils/shared/shared_prefe.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ControllerAuth {
  var log = Logger();
  final supabase = Supabase.instance.client;

  Future<bool> signInUseEmail(String email, String password) async {
    UserProvider _userProvider = UserProvider();
    bool _value = false;
    SharedPref sharedPref = SharedPref();
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      _userProvider.setNameUser(res.user?.userMetadata?['first_name'],
          res.user?.userMetadata?['last_name']);
      if (res.user?.email != null) {
        // log.e(
        //     '${res.user?.userMetadata?['first_name']} ${res.user?.userMetadata?['last_name']}');
        _value = !_value;
        sharedPref.setAccessToken(res.session?.accessToken != null);
      } else {
        _value = _value;
      }
    } catch (error) {
      log.e("Controller Sign In: $error");
    }
    return _value;
  }

  Future<bool> signUpUseEmail(
      String email, String password, String firstName, String lastName) async {
    bool _value = false;
    try {
      final res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          "first_name": firstName,
          "last_name": lastName,
        },
      );
      log.i(res.user?.email);
      if (res.user?.email != null) {
        _value = !_value;
      } else {
        _value = _value;
      }
    } catch (error) {
      log.e("Controller Sign Up: $error");
    }
    return _value;
  }
}
