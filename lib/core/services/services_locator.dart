import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // /// movies bloc
    // /// registerFactory => علشان كل لما ادخل علي الصفحه يعمل اوبجت جديد وينادي علي الداتا من ال api
    // sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    //
    // /// movies use case
    // /// registerLazySingleton => بيعمل اوبجكت لما انا دي عليه او لما احتاجه
    // sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    // sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    // sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    //
    // /// movies repositories
    // sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    //
    // /// movies remote data source
    // sl.registerLazySingleton<BaseMovieRemoteDataSource>(
    //     () => MovieRemoteDataSource());
  }
}
