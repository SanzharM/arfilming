import 'package:arfilming/src/core/api/api.dart';
import 'package:arfilming/src/core/services/local_storage/local_storage.dart';
import 'package:arfilming/src/data/datasources/authentication/authentication_datasource.dart';
import 'package:arfilming/src/data/datasources/movie/movie_datasource.dart';
import 'package:arfilming/src/data/datasources/user/user_datasource.dart';
import 'package:arfilming/src/data/repositories_impl/authentication/authentication_repository_impl.dart';
import 'package:arfilming/src/data/repositories_impl/movie/movie_repository_impl.dart';
import 'package:arfilming/src/data/repositories_impl/user/user_repository_impl.dart';
import 'package:arfilming/src/domain/repositories/authentication/authentication_repository.dart';
import 'package:arfilming/src/domain/repositories/movie/movie_repository.dart';
import 'package:arfilming/src/domain/repositories/user/user_repository.dart';
import 'package:arfilming/src/presentation/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton(() => const AppRouter())
    ..registerLazySingleton(() => LocalStorage())
    ..registerLazySingleton(() => Connectivity())
    ..registerLazySingleton(() => Api())

    // Repositories
    ..registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(sl()),
    )
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl()),
    )

    // Datasources
    ..registerLazySingleton<MovieDatasource>(
      () => MovieDatasourceImpl(sl()),
    )
    ..registerLazySingleton<AuthenticationDatasource>(
      () => AuthenticationDataSourceImpl(sl()),
    )
    ..registerLazySingleton<UserDatasource>(
      () => UserDatasourceImpl(sl()),
    );
}

Future<void> reinitialize() async {
  return await sl.reset().then((value) => initialize());
}
