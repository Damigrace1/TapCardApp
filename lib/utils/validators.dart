import 'package:email_validator/email_validator.dart';

class Validators {
  // email validsator
  static String? emailValidator(String? email) {
    final regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (email!.isEmpty && !EmailValidator.validate(email)) {
      return 'Enter your email';
    } else if (regExp.hasMatch(email.trim())) {
      'good';
    }
    return null;
  }

//password validator
  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Enter your password';
    } else if (password.length < 6) {
      return "Password can't be smaller than 6 characters";
    }
    return null;
  }

  static String? validateTextField(String? val) {
    if (val!.isEmpty) {
      return 'Required Field';
    }
    return null;
  }
}
