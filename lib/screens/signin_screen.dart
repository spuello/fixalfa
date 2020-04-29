import 'package:app/components/auth_choice_divider.dart';
import 'package:app/components/custom_text_field.dart';
import 'package:app/components/primary_flat_button.dart';
import 'package:app/components/social_media_auth_button.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String id = "login_screen";

  @override
  Widget build(BuildContext context) {
    SizedBox verticalSideBox = SizedBox(
      height: 10.0,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomTextField(
                      hintText: "Correo electrónico",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    verticalSideBox,
                    CustomTextField(
                      hintText: "Contraseña",
                      obscureText: true,
                    ),
                    verticalSideBox,
                    PrimaryFlatButton(
                      color: kPrimaryColor,
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
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
