import 'package:ai_blog_flutter/core/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DioClient {
  static final Dio _authenticatedDio = Dio(BaseOptions(
    baseUrl: "http://127.0.0.1:8000/api",
    connectTimeout: const Duration(seconds: 5000),
    receiveTimeout: const Duration(seconds: 3000),
  ));

  static final Dio _unauthenticatedDio = Dio(BaseOptions(
    baseUrl: "http://127.0.0.1:8000/api",
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

  static void setup(GetIt getIt) {
    getIt.registerLazySingleton<Dio>(()=>DioClient.unauthenticatedInstance,
        instanceName: 'unauthenticatedDio');
    getIt.registerLazySingleton<Dio>(()=>DioClient.authenticatedInstance,
        instanceName: 'authenticatedDio');
  }

  static Dio get unauthenticatedInstance => _unauthenticatedDio;
}
