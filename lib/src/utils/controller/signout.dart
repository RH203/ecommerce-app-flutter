import 'package:ecommerce_app/src/utils/shared/shared_prefe.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignOut {
  var log = Logger();
  final supabase = Supabase.instance.client;

  Future<void> logOutUser() async {
    SharedPref sharedPref = SharedPref();
    sharedPref.setAccessToken(false);
    await supabase.auth.signOut();
  }
}
