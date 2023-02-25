import 'package:arfilming/src/core/services/local_storage/local_storage.dart';
import 'package:arfilming/src/presentation/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton(() => const AppRouter())
    ..registerLazySingleton(() => LocalStorage())
    ..registerLazySingleton(() => Connectivity());
}

Future<void> reinitialize() async {
  return await sl.reset().then((value) => initialize());
}
