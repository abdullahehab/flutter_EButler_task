import 'package:flutter_ebutler_task/core/utils/app_constants.dart';

class Validator {
  static bool isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    final RegExp exp = RegExp(AppConstants.emailRegex);
    return exp.hasMatch(email);
  }

  static bool isPassword(String password) {
    return password.length > 6;
  }
}
