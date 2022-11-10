import 'package:dartz/dartz.dart';
import 'package:flutter_ebutler_task/features/auth/data/models/user_model.dart';

List<UserModel> _usersList = [];

abstract class BaseAuthRemoteDataSource {
  Future<Unit> registerLogin(UserModel userModel);
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  @override
  Future<Unit> registerLogin(UserModel userModel) {
    _usersList.add(userModel);
    return Future.value(unit);
  }
}
