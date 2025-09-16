
import 'package:dio/dio.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource { Future<UserModel> login(String email, String password); }

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio; AuthRemoteDataSourceImpl({required this.dio});
  @override
  Future<UserModel> login(String email, String password) async {

    await Future.delayed(const Duration(milliseconds: 400));
    if (password == 'password') return UserModel.fromJson({'id': '1', 'name': 'Demo User', 'email': email});
    throw DioException(requestOptions: RequestOptions(path: '/login'));
  }
}
