import 'package:app/blocs/login/bloc.dart';
import 'package:app/repositories/user_repositories.dart';
import 'package:app/screens/Login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "login_screen";
  final UserRepository _userRepository = UserRepository();

//  SignInScreen({UserRepository userRepository})
//      : assert(userRepository != null),
//        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: _userRepository),
          child: LoginForm(
              //userRepository: _userRepository,
              ),
        ),
      ),
    );
  }
}
