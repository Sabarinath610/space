// FILE: lib/features/auth/data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';

import '../../domain/usecases/login_usecase.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  final AuthRemoteDataSource remote;
  AuthRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final m = await remote.login(email, password);
      return Right(m.toEntity());
    } on DioException catch (_) {
      return Left(Failure('Invalid credentials or network error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}