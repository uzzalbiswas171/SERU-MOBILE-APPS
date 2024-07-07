import 'package:equatable/equatable.dart';
import 'package:seru_test_project/model/login_model.dart';


abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class UserAuthenticated extends LoginState {
  final LoginModel loginData;

  UserAuthenticated({required this.loginData});

  @override
  List<LoginModel> get props => [loginData];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class LoginDataLoadedSuccessfully extends LoginState {
  final LoginModel userData;

  LoginDataLoadedSuccessfully({required this.userData});

  @override
  List<Object> get props => [userData];
}


class LoginStatusSetFailed extends LoginState {}
