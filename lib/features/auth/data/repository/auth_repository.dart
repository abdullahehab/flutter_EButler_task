import 'package:dartz/dartz.dart';
import 'package:flutter_ebutler_task/core/error/failure.dart';
import 'package:flutter_ebutler_task/features/auth/data/datasource/remove_data_source.dart';
import 'package:flutter_ebutler_task/features/auth/data/models/user_model.dart';
import 'package:flutter_ebutler_task/features/auth/domain/repository/base_auth_repository.dart';
import 'package:flutter_ebutler_task/features/auth/domain/usecaese/login_usecase.dart';

class AuthRepository implements BaseAuthRepository {
  AuthRepository(this.remoteDataSource);
  BaseAuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Unit>> registerLogin(LoginParameters parameter) async {
    UserModel model =
        UserModel(email: parameter.email, password: parameter.password);
    final result = await remoteDataSource.registerLogin(model);
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
