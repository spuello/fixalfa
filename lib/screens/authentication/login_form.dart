import 'package:app/blocs/login/bloc.dart';
import 'package:app/components/auth_choice_divider.dart';
import 'package:app/components/facebook_button.dart';
import 'package:app/components/google_button.dart';
import 'package:app/components/primary_flat_button.dart';
import 'package:app/components/text_formfield_decoration.dart';
import 'package:app/screens/cockpit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors.dart';
import '../../constants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty & _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  Widget build(BuildContext context) {
    SizedBox verticalSideBox = SizedBox(height: 20.0);
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state.isFailure) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Inicio de sección fallido"),
                  Icon(Icons.error)
                ],
              ),
              backgroundColor: Colors.red));
      }

      if (state.isSubmitting) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Iniciando sesión..."),
                CircularProgressIndicator()
              ],
            ),
          ));
      }

      if (state.isSuccess) {
        Navigator.pushNamed(context, CockpitScreen.routeName);
        //BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Form(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
              child: Text(
                "FIXALFA",
                style: kLogoTypeStyle(color: kFixalfaGreen500),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: TexTFormFieldInputDecoration.getDecoration(
                  hintText: "Correo electrónico", iconData: Icons.email),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                return !state.isEmailValid ? "Correo Invalido" : null;
              },
            ),
            verticalSideBox,
            TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: TexTFormFieldInputDecoration.getDecoration(
                    hintText: "Contraseña", iconData: Icons.lock),
                autovalidate: true,
                autocorrect: false,
                validator: (_) {
                  return !state.isPasswordValid ? "Contraseña Invalidad" : null;
                }),
            verticalSideBox,
            PrimaryFlatButton(
              color: kFixalfaGreen500,
              title: "Iniciar sesión",
              textColor: kFixalfaBackgroundWhite,
              onPressed: isLoginButtonEnabled(state) ? _onFormSubmitted : null,
              borderSideColor: Colors.transparent,
            ),
            verticalSideBox,
            AuthChoiceDivider(),
            verticalSideBox,
            FacebookButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context)
                    .add(LoginWithFacebookPressed());
              },
            ),
            verticalSideBox,
            GoogleButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context)
                    .add(LoginWithGooglePressed());
              },
            ),
          ],
        ),
      );
    }));
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentialsPressed(
        email: _emailController.text, password: _passwordController.text));
  }
}
