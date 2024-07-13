import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seru_test_project/View/Auth/Login/bloc/login_bloc.dart';
import 'package:seru_test_project/View/Auth/Login/screens/login_screen.dart';

class LoginScreenBuilder extends StatelessWidget {
  const LoginScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginScreen(),
        ),
      ),
    );
  }
}
