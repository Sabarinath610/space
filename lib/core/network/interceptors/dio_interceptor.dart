import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../security/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _secure = GetIt.I<SecureStorage>();
  final Dio _dio = GetIt.I<Dio>();

  bool _refreshing = false;
  final List<PendingRequest> _queue = [];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secure.read('access_token');
    if (token != null && token.isNotEmpty)
      options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // If 401, attempt refresh
    if (err.response?.statusCode == 401) {
      final options = err.requestOptions;
      // queue and refresh if not already refreshing
      final completer = Completer<Response>();
      _queue.add(PendingRequest(options, completer));

      if (!_refreshing) {
        _refreshing = true;
        try {
          await _handleRefresh();
          _refreshing = false;
          // re-run queued requests
          for (var req in _queue) {
            final newToken = await _secure.read('access_token');
            if (newToken != null)
              req.options.headers['Authorization'] = 'Bearer $newToken';
            final response = await _dio.fetch(req.options);
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

      // return the future of the queued request
      try {
        final r = await completer.future;
        handler.resolve(r);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }

    handler.next(err);
  }

  Future<void> _handleRefresh() async {
    final refreshToken = await _secure.read('refresh_token');
    if (refreshToken == null) throw Exception('No refresh token');

    // call refresh endpoint
    final resp = await _dio.post(
      '/auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    final newAccess = resp.data['access_token'];
    final newRefresh = resp.data['refresh_token'];
    await _secure.write('access_token', newAccess);
    if (newRefresh != null) await _secure.write('refresh_token', newRefresh);
  }
}

class PendingRequest {
  final RequestOptions options;
  final Completer<Response> completer;
  PendingRequest(this.options, this.completer);
}
