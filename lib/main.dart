import 'package:ai_blog_flutter/core/dependencies/init_dependencies.dart';
import 'package:ai_blog_flutter/core/themes/theme.dart';
import 'package:ai_blog_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ai_blog_flutter/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()  {
  initDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (_) => getIt<AuthBloc>())
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
