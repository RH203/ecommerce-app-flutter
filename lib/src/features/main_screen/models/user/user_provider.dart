import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  var log = Logger();
  String? _firstName, _lastName, _profile;

  void setNameUser(String firstName, String secondName) {
    _firstName = firstName;
    _lastName = secondName;
    log.i("setNameUser[USER_PROVIDER]: $_firstName $_lastName");
    notifyListeners();
  }

  void setProfileUser(String profile) {
    log.i(profile);
    _profile = profile;
    notifyListeners();
  }

  String? get firstName => _firstName ?? "";
  String? get lastName => _lastName ?? "";
  String? get profile => _profile;
}
