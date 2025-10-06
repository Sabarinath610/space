
import 'dart:async';
import 'package:dio/dio.dart';
import '../../security/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage? secureStorage;
  final Dio dio;

  bool _refreshing = false;
  final List<PendingRequest> _queue = [];

  AuthInterceptor({required this.secureStorage, required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await secureStorage?.read('access_token');
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // Fail safe - don't block requests due to storage errors
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // If 401, attempt refresh flow
    if (err.response?.statusCode == 401) {
      final options = err.requestOptions;
      final completer = Completer<Response<dynamic>>();
      _queue.add(PendingRequest(options, completer));

      if (!_refreshing) {
        _refreshing = true;
        try {
          await _handleRefresh();
          // Replay queued requests
          for (var req in _queue) {
            final newToken = await secureStorage?.read('access_token');
            if (newToken != null) req.options.headers['Authorization'] = 'Bearer $newToken';
            final response = await dio.fetch(req.options);
            req.completer.complete(response);
          }
        } catch (e) {
          for (var req in _queue) {
            req.completer.completeError(e);
          }
        } finally {
          _queue.clear();
          _refreshing = false;
        }
      }

      // Return queued future result to original requestor
      try {
        final r = await completer.future;
        handler.resolve(r);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }

    handler.next(err); // default pass-through
  }

  Future<void> _handleRefresh() async {
    final refreshToken = await secureStorage?.read('refresh_token');
    if (refreshToken == null) throw Exception('No refresh token');

    // Ensure '/auth/refresh' path is correct for your API.
    final resp = await dio.post('/auth/refresh', data: {'refresh_token': refreshToken});
    final newAccess = resp.data['access_token'];
    final newRefresh = resp.data['refresh_token'];
    if (newAccess != null) await secureStorage?.write('access_token', newAccess);
    if (newRefresh != null) await secureStorage?.write('refresh_token', newRefresh);
  }
}

class PendingRequest {
  final RequestOptions options;
  final Completer<Response<dynamic>> completer;
  PendingRequest(this.options, this.completer);
}
