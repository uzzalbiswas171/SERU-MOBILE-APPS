import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seru_test_project/View/Auth/RegisterScreen/bloc/registration_event.dart';
import 'package:seru_test_project/View/Auth/RegisterScreen/bloc/registration_state.dart';
import 'package:seru_test_project/service/registration_service.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitialState()) {
    on<RegistrationSubmitEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      try {
        var res = await RegistrationService()
            .submitRegistration(event.email, event.password);

        if (res != null) {
          emit((RegistrationSuccessState(registrationModel: res)));
        }
      } catch (error) {
        seruLogPrint("Error: $error");

        emit((RegistrationFailureState(error: "error.message")));
      }
    });
  }
}
