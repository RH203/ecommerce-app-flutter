class Validator {
  static RegExp must8 = RegExp('.{8,}');
  static RegExp validEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static bool emailIsValid(String email) {
    return validEmail.hasMatch(email);
  }

  static bool passwordIsValid(String password) {
    return must8.hasMatch(password);
  }

  static bool usernameIsValid(String username) {
    return username.length > 5;
  }

  static bool searchIsValid(String search) {
    return search.length > 3;
  }
}
