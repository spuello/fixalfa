part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class SignUpEvent extends RegistrationEvent {
  String email, password;
  SignUpEvent({this.email, this.password});

  @override
  // TODO: implement props
  List<Object> get props => null;
}
