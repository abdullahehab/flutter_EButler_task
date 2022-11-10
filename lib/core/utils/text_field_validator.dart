import 'package:flutter_ebutler_task/core/utils/validators.dart';

class TextFieldValidators {
  static String? isEmail(String? email) {
    if (Validator.isEmail(email!)) return null;
    return 'البريد الإلكترونية مطلوب و بشكل صحيح';
  }

  static String? isPassword(String? password) {
    if (Validator.isPassword(password!)) return null;
    return 'الرقم السري مطلوب';
  }
}
