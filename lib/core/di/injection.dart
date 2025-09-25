import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/domain/presentation/bloc/auth_bloc.dart';
import '../network/dio_client.dart';

import '../network/interceptors/dio_interceptor.dart';
import '../security/secure_storage.dart';
import '../theme/bloc/theme_bloc.dart';
import '../utils/network_info.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init({required String baseUrl}) async {
  // External
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => SecureStorage());

  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  // Dio
  sl.registerLazySingleton<Dio>(() {
    final dio = DioClient(baseUrl: baseUrl).dio;
    dio.interceptors.add(AuthInterceptor());
    return dio;
  });

  // Feature
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<AuthRepositoryInterface>(
    () => AuthRepositoryImpl(remote: sl()),
  );
  sl.registerLazySingleton(() => AuthRepositoryImpl(remote: sl()));
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerFactory(() => AuthBloc(loginUseCase: sl(), repo: sl()));

  // Theme
  sl.registerFactory(() => ThemeBloc(prefs: sl()));
}
