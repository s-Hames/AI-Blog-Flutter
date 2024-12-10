import 'package:ai_blog_flutter/core/network/dio_client.dart';
import 'package:ai_blog_flutter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ai_blog_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_blog_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:ai_blog_flutter/features/auth/domain/usecases/user_sign_up.dart';
import 'package:ai_blog_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  DioClient.setup(getIt);
  _initAuth();
}

void _initAuth() {
  getIt.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt(instanceName: "unauthenticatedDio")));
  getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl(getIt()));
  getIt.registerFactory(() => UserSignUp(getIt()));

  getIt.registerLazySingleton<AuthBloc>(() => AuthBloc(userSignUp: getIt()));
}
