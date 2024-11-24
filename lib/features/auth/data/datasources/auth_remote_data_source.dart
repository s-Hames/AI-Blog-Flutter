abstract interface class AuthRemoteDataSource{
    Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  });
  
  Future<String> signInWithEmailPassword({
    required String email,
    required String password
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  @override
  Future<String> signInWithEmailPassword({required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({required String name, required String email, required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }

}