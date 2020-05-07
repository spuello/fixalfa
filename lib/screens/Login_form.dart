import 'package:app/blocs/login/bloc.dart';
import 'package:app/components/auth_choice_divider.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/primary_flat_button.dart';
import 'package:app/components/social_media_auth_button.dart';
import 'package:app/repositories/user_repositories.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository = UserRepository();

  //TODO: QUITAR COMENTARIO DEL REPOSIORIO VACIO Y PONER VARIABLE DE REPOSITORIO SIN INICIALIZAR
//  LoginForm({@required UserRepository userRepository})
//      : assert(userRepository != null),
//        _userRepository = userRepository;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty & _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    // _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPassswordChanged);
  }

  Widget build(BuildContext context) {
    SizedBox verticalSideBox = SizedBox(
      height: 20.0,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "FIXALFA",
                        style: kLogoTypeStyle(color: kFixalfaGreen500),
                      )),
                ),
                CustomTextField(
                  onChanged: (value) {},
                  hintText: "Correo electrónico",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSideBox,
                CustomTextField(
                  onChanged: (value) {},
                  hintText: "Contraseña",
                  obscureText: true,
                ),
                verticalSideBox,
                PrimaryFlatButton(
                  color: kFixalfaGreen500,
                  title: "Iniciar sesión",
                  textColor: Colors.white,
                  onPressed: () {},
                  borderSideColor: Colors.transparent,
                ),
                verticalSideBox,
                AuthChoiceDivider(),
                verticalSideBox,
                SocialMediaAuthButton(
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  buttonTitle: "Iniciar con Facebook",
                  buttonBackgroundColor: (kFacebookBlueColor),
                  buttonImage: "images/icons/facebook-logo.png",
                  onTap: () {
                    print("Facebook LOGIN");
                  },
                ),
                verticalSideBox,
                SocialMediaAuthButton(
                  buttonImage: "images/icons/google-logo.png",
                  buttonBackgroundColor: kGoogleRedColor,
                  borderColor: (Colors.transparent),
                  textColor: Colors.white,
                  buttonTitle: "Iniciar con Google",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPassswordChanged() {}

  void _onEmailChanged() {}
}
