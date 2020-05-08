part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User currentUser;

  const Authenticated({this.currentUser});

  @override
  // TODO: implement props
  List<Object> get props => [currentUser];
}

class Unauthenticated extends AuthenticationState {}
