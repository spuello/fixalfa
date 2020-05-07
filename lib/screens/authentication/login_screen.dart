import 'package:app/blocs/login/bloc.dart';
import 'package:app/colors.dart';
import 'package:app/repositories/user_repositories.dart';
import 'package:app/screens/authentication/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login_screen";
  @override
  Widget build(BuildContext context) {
    final UserRepository _userRepository =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: kFixalfaBackgroundWhite,
      body: SafeArea(
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: _userRepository),
          child: LoginForm(
            userRepository: _userRepository,
          ),
        ),
      ),
    );
  }
}
