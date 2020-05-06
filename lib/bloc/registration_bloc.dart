import 'dart:async';

import 'package:app/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  UserRepository userRepository;

  RegistrationBloc() {
    userRepository = UserRepository();
  }

  @override
  RegistrationState get initialState => RegistrationInitial();

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is SignUpEvent) {
      try {
        var user = await userRepository.createUser(event.email, event.password);
        yield UserRegistrationSuccessful(user: user);
      } catch (e) {
        UserRegistrationFailure(message: e.toString());
      }
    }
  }
}
