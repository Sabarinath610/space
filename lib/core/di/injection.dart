
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

  sl.registerLazySingleton(() => Connectivity());


  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<SecureStorage>(() => SecureStorage.auto(prefs));


  sl.registerLazySingleton(() => NetworkInfo(sl<Connectivity>()));


  final dioClient = DioClient(baseUrl: baseUrl);
  sl.registerLazySingleton<Dio>(() => dioClient.dio);


  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(
    secureStorage: sl<SecureStorage>(),
    dio: sl<Dio>(),
  ));


  sl<Dio>().interceptors.add(sl<AuthInterceptor>());

  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: sl<Dio>()),
  );


  sl.registerLazySingleton<AuthRepositoryInterface>(
        () => AuthRepositoryImpl(remote: sl<AuthRemoteDataSource>()),
  );


  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(repository: sl<AuthRepositoryInterface>()));


  sl.registerFactory<AuthBloc>(() => AuthBloc(
    loginUseCase: sl<LoginUseCase>(),
    repo: sl<AuthRepositoryInterface>(),
  ));


  sl.registerFactory(() => ThemeBloc(prefs: sl<SharedPreferences>()));
}
