// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:ecommerce_app/src/features/main_screen/models/user/user_provider.dart';
import 'package:ecommerce_app/src/utils/shared/shared_prefe.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ControllerAuth {
  var log = Logger();
  final supabase = Supabase.instance.client;

  Future<bool> signInUseEmail(
      String email, String password, BuildContext context) async {
    BuildContext _context = context;
    UserProvider _userProvider = UserProvider();
    bool _value = false;
    SharedPref sharedPref = SharedPref();
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user?.userMetadata != null) {
        _value = !_value;
        _context.read<UserProvider>().setNameUser(
            res.user?.userMetadata?['first_name'],
            res.user?.userMetadata?['last_name']);

        sharedPref.setExpiredToken(
          res.session?.expiresAt ?? DateTime.now().millisecondsSinceEpoch + 100,
        );
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
