import 'package:ai_blog_flutter/core/wigdets/custom_TextField.dart';
import 'package:ai_blog_flutter/core/wigdets/custom_button.dart';
import 'package:ai_blog_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 44, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                con: nameController,
                onChanged: (value) {},
                hintText: 'Name',
                icon: Icons.account_circle,
              ),
              CustomTextField(
                con: emailController,
                onChanged: (value) {},
                hintText: 'Email',
                icon: Icons.email,
              ),
              CustomTextField(
                obscureText: true,
                con: passwordController,
                onChanged: (value) {},
                hintText: 'Password',
                icon: Icons.lock,
              ),
              CustomTextField(
                conf: passwordController.text,
                obscureText: true,
                con: confirmPasswordController,
                onChanged: (value) {},
                hintText: 'Confirm Password',
                icon: Icons.lock,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(AuthSignUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text));
                  }
                },
                text: "Register",
              )
            ],
          ),
        ),
      ),
    );
  }
}
