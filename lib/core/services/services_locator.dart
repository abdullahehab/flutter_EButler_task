import 'package:flutter_ebutler_task/features/auth/data/datasource/remove_data_source.dart';
import 'package:flutter_ebutler_task/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_ebutler_task/features/auth/domain/repository/base_auth_repository.dart';
import 'package:flutter_ebutler_task/features/auth/domain/usecaese/login_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// auth usecase
    sl.registerLazySingleton(() => LoginUseCase(sl()));

    /// auth repositories
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    /// auth remote data source
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}
