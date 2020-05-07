import 'package:app/blocs/authentication/authentication_bloc.dart';
import 'package:app/colors.dart';
import 'package:app/repositories/user_repositories.dart';
import 'package:app/screens/Login_form.dart';
import 'package:app/screens/cockpit.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/registration_screen.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:app/screens/technicians-screen.dart';
import 'package:app/screens/vendor_screen.dart';
import 'package:app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final UserRepository userRepository = UserRepository();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: FixAlfaApp(
      userRepository: userRepository,
    ),
  ));
}

class FixAlfaApp extends StatelessWidget {
  final UserRepository _userRepository;

  FixAlfaApp({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _kFixalfaTheme,
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is Uninitialized) {
          return SplashScreen();
        }
        if (state is Authenticated) {
          print(state.currentUser);
          return CockpitScreen();
        }
        //return WelcomeScreen();
        return LoginForm();

//        return Container(
//          child: Center(
//            child: Text("Not Authenticated"),
//          ),
//        );
      }),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        CockpitScreen.id: (context) => CockpitScreen(),
        Technicians.id: (context) => Technicians(),
        VendorScreen.id: (context) => VendorScreen()
      },
    );
  }
}

final ThemeData _kFixalfaTheme = _kBuildFixalfaTheme();

ThemeData _kBuildFixalfaTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kFixalfaGreen50,
    primaryColor: kFixalfaGreen500,
    scaffoldBackgroundColor: kFixalfaGreen400,
    appBarTheme: AppBarTheme().copyWith(
      color: kFixalfaGreen400,
      elevation: 0.0,
    ),
    primaryIconTheme: base.iconTheme.copyWith(color: Colors.white),
  );
}
