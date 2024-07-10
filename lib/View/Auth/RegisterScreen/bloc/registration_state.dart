import 'package:equatable/equatable.dart';
import 'package:seru_test_project/model/login_model.dart';
import 'package:seru_test_project/model/registration_model.dart';


abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {
  final RegistrationModel registrationModel;

  RegistrationSuccessState({required this.registrationModel});

  @override
  List<RegistrationModel> get props => [registrationModel];
}

class RegistrationFailureState extends RegistrationState {
  final String error;

  const RegistrationFailureState({required this.error});

  @override
  List<Object> get props => [error];
}


