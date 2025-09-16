
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user.dart';

class LoginParams { final String email; final String password; LoginParams({required this.email, required this.password}); }

abstract class AuthRepositoryInterface { Future<Either<Failure, User>> login(String email, String password); }

class LoginUseCase {
  final AuthRepositoryInterface repository; LoginUseCase({required this.repository});
  Future<Either<Failure, User>> call(LoginParams params) async { if (params.email.isEmpty || params.password.isEmpty) return Left(Failure('Email/password required')); return repository.login(params.email, params.password); }
}
