import 'package:ai_blog_flutter/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Either<Failure, String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  });
  Either<Failure, String> signInWithEmailPassword({
    required String email,
    required String password
  });
}
