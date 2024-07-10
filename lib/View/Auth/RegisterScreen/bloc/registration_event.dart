import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class RegistrationSubmitEvent extends RegistrationEvent {
  final String email;
  final String password;

  const RegistrationSubmitEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'Registration submit pressed with { username: $email, password: $password }';
}
