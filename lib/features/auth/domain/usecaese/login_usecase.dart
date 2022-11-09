import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ebutler_task/core/error/failure.dart';
import 'package:flutter_ebutler_task/core/usecase/base_usecase.dart';
import 'package:flutter_ebutler_task/features/auth/domain/repository/base_auth_repository.dart';

class LoginUseCase extends BaseUsecase<Unit, LoginParameters> {
  LoginUseCase(this.repository);
  BaseAuthRepository repository;
  @override
  Future<Either<Failure, Unit>> call(LoginParameters parameter) {
    return repository.registerLogin(parameter);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
