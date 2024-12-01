import 'package:ai_blog_flutter/core/error/failures.dart';
import 'package:ai_blog_flutter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ai_blog_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  AuthRepositoryImpl(this.authRemoteDataSourceImpl);
  @override
  Future<Either<Failure, String>> signInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await authRemoteDataSourceImpl.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
