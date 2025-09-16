import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  DioClient._(this.dio);

  factory DioClient({required String baseUrl}) {
    final d = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
      headers: {'Accept': 'application/json'},
    ));

    d.interceptors.add(LogInterceptor(request: true, requestBody: true, responseBody: true));
    return DioClient._(d);
  }
}
