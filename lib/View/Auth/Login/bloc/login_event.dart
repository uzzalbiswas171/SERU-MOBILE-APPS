import 'package:equatable/equatable.dart';


abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginAuthenticationEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginAuthenticationEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password }';
}

class LoginSessionEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}