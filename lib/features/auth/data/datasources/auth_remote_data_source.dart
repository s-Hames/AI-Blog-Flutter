import 'package:ai_blog_flutter/core/error/api_error_handler.dart';
import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(
      {required String name, required String email, required String password});

  Future<String> signInWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<String> signInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _dio.post('/auth/register',
          data: {"name": name, "email": email, "password": password});
      return response.data.toString();
    } on DioException catch (e) {
      throw ApiErrorHandler.parseErrors(e.response?.data ?? {});
    }
  }
}
