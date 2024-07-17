import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seru_test_project/View/Auth/Login/bloc/login_event.dart';
import 'package:seru_test_project/View/Auth/Login/bloc/login_state.dart';
import 'package:seru_test_project/model/login_model.dart';
import 'package:seru_test_project/service/login_service.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';
import 'package:seru_test_project/utils/user_secret.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        UserSecret.token = null;

        var res = await Authentication().auth(event.email, event.password);

        if (res == 401) {
          emit((LoginFailure(error: "Wrong user credential!!!")));
        } else if (res != null) {
          seruLogPrint('lllll----->>>>$res');
          emit((UserAuthenticated(loginData: res)));
        }
      } catch (error) {
        seruLogPrint("Error: $error");

        emit((LoginFailure(error: "error.message")));
      }
    });

    // on<LoginSessionEvent>((event, emit) async {
    //   try {
    //     var res = await LoginSession().setSession();
    //
    //     if (res != null) {
    //       UserSecret.setUserInfo(res);
    //       // emit(( UserEnlisted()));
    //     } else {
    //       agbLogPrint("Error:");
    //     }
    //   } catch (error) {
    //     // sktPrint("Error: $error");
    //     // ibAlertDialog(AppLocalization.of(IBContext.context)
    //     //     .getTranslatedValues('SOMETHING_WENTS_WRONG'));
    //   }
    // }
    // );
  }
}
