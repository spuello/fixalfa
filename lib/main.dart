import 'package:app/blocs/authentication/authentication_bloc.dart';
import 'package:app/colors.dart';
import 'package:app/repositories/user_repositories.dart';
import 'package:app/screens/authentication/authentication_screen.dart';
import 'package:app/screens/authentication/login_screen.dart';
import 'package:app/screens/authentication/registration_screen.dart';
import 'package:app/screens/cockpit.dart';
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
          return CockpitScreen();
        }
        return WelcomeScreen();
      }),
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        AuthenticationScreen.routeName: (context) => AuthenticationScreen(),
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        CockpitScreen.routeName: (context) => CockpitScreen(),
        Technicians.routeName: (context) => Technicians(),
        VendorScreen.routeName: (context) => VendorScreen()
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
