
import 'package:dartz/dartz.dart';
import 'package:flutter_ebutler_task/core/error/failure.dart';
import 'package:flutter_ebutler_task/features/auth/domain/usecaese/login_usecase.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Unit>> registerLogin(LoginParameters parameter);
}