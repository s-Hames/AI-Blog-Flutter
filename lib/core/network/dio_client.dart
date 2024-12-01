import 'package:ai_blog_flutter/core/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  static final Dio _authenticatedDio = Dio(BaseOptions(
    baseUrl: "http://128.0.0.1:8000",
    connectTimeout: const Duration(seconds: 5000),
    receiveTimeout: const Duration(seconds: 3000),
  ));

  static final Dio _unauthenticatedDio = Dio(BaseOptions(
    baseUrl: "http://128.0.0.1:8000",
    connectTimeout: const Duration(seconds: 5000),
    receiveTimeout: const Duration(seconds: 3000),
  ));

  DioClient.internal();

  static Dio get authenticatedInstance {
    if (_authenticatedDio.interceptors.isEmpty) {
      _authenticatedDio.interceptors.addAll([
        AuthInterceptor(),
        LogInterceptor(requestBody: true, responseBody: true),
      ]);
    }
    return _authenticatedDio;
  }

  static Dio get unauthenticatedInstance => _unauthenticatedDio;
}
