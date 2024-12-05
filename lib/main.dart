import 'package:ai_blog_flutter/core/network/dio_client.dart';
import 'package:ai_blog_flutter/core/themes/theme.dart';
import 'package:ai_blog_flutter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ai_blog_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ai_blog_flutter/features/auth/domain/usecases/user_sign_up.dart';
import 'package:ai_blog_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_blog_flutter/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => AuthBloc(
            userSignUp: UserSignUp(AuthRepositoryImpl(
                AuthRemoteDataSourceImpl(DioClient.unauthenticatedInstance)))))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SignUpPage());
  }
}
