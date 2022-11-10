import 'package:flutter/material.dart';
import 'package:flutter_ebutler_task/features/auth/domain/usecaese/login_usecase.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this._loginUseCase);
  LoginUseCase _loginUseCase;

  Future loginRegister(LoginParameters parameters) async {
    var result = await _loginUseCase(parameters);
    result.fold((failure) => print('login message error > ${failure.message}'),
        (success) => print('logged in with success'));
  }
}
