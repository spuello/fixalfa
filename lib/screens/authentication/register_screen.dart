import 'package:app/blocs/register/bloc.dart';
import 'package:app/colors.dart';
import 'package:app/repositories/user_repositories.dart';
import 'package:app/screens/authentication/register_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFixalfaBackgroundWhite,
      body: SafeArea(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: UserRepository()),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
