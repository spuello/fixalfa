import 'package:app/blocs/authentication/authentication_bloc.dart';
import 'package:app/blocs/register/bloc.dart';
import 'package:app/components/auth_choice_divider.dart';
import 'package:app/components/facebook_button.dart';
import 'package:app/components/google_button.dart';
import 'package:app/components/primary_flat_button.dart';
import 'package:app/components/text_formfield_decoration.dart';
import 'package:app/repositories/user_repositories.dart';
import 'package:app/screens/cockpit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors.dart';
import '../../constants.dart';
import 'login_screen.dart';

class RegisterForm extends StatefulWidget {
  static const String routeName = "registration_screen";
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty & _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  SizedBox getVerticalSideBox({double height: 15.0}) => SizedBox(
        height: height,
      );

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChange);
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                children: <Widget>[
                  Text("Registrando..."),
                  CircularProgressIndicator()
                ],
              ),
            ));
        }

        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.pushNamed(context, CockpitScreen.routeName);
        }

        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                children: <Widget>[Text("Registro fallido"), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ));
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Form(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 50.0),
                  child: Text(
                    "FIXALFA",
                    style: kLogoTypeStyle(color: kFixalfaGreen500),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: TexTFormFieldInputDecoration.getDecoration(
                      hintText: "Correo electrónico", iconData: Icons.email),
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_) {
                    return !state.isEmailValid ? "Correo invalidao" : null;
                  },
                ),
                getVerticalSideBox(),
                TextFormField(
                  controller: _passwordController,
                  decoration: TexTFormFieldInputDecoration.getDecoration(
                      hintText: "Contraseña", iconData: Icons.lock),
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_) {
                    return !state.isPasswordValid
                        ? "Contraseña incorrecta"
                        : null;
                  },
                ),
                getVerticalSideBox(),
                PrimaryFlatButton(
                  title: "Registrar",
                  color: kFixalfaGreen500,
                  textColor: Colors.white,
                  onPressed:
                      isRegisterButtonEnabled(state) ? _onFormSubmitted : null,
                ),
                getVerticalSideBox(
                  height: 30.0,
                ),
                AuthChoiceDivider(),
                getVerticalSideBox(),
                FacebookButton(
                  onPressed: () {
                    BlocProvider.of<RegisterBloc>(context)
                        .add(RegisterWithFacebookPressed());
                  },
                ),
                getVerticalSideBox(),
                GoogleButton(
                  onPressed: () {
                    BlocProvider.of<RegisterBloc>(context)
                        .add(RegisterWithGooglePressed());
                  },
                ),
                getVerticalSideBox(height: 30.0),
                Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Al registrarse, acepta los "),
                    TextSpan(
                        text: "Términos de servicio",
                        style: TextStyle(color: Colors.blue)),
                    TextSpan(text: " y la "),
                    TextSpan(
                        text: "Política de privacidad",
                        style: TextStyle(color: Colors.blue))
                  ]),
                  style: TextStyle(fontSize: 16.0, height: 1.5),
                  textAlign: TextAlign.center,
                ),
                getVerticalSideBox(height: 30.0),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "¿Ya tienes una cuenta?"),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, LoginScreen.routeName,
                                arguments: UserRepository());
                          },
                        text: " Inciar sesión",
                        style: TextStyle(color: Colors.blue))
                  ], style: TextStyle(fontSize: 16.0)),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChange() {
    print("register_form : fue llamada on passwordchagne");
    _registerBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(Submitted(
        email: _emailController.text, password: _passwordController.text));
  }
}
