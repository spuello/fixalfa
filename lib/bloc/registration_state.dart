part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class RegistrationInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationSuccessful extends RegistrationState {
  FirebaseUser user;

  UserRegistrationSuccessful({@required this.user});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class UserRegistrationFailure extends RegistrationState {
  String message;

  UserRegistrationFailure({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => null;
}
