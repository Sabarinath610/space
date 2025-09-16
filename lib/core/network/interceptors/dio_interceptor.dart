import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../security/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _secure = GetIt.I<SecureStorage>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secure.read('access_token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}
