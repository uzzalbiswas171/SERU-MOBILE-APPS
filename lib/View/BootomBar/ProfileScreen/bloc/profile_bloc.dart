import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/bloc/profile_event.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/bloc/profile_state.dart';
import 'package:seru_test_project/model/profile_model.dart';
import 'package:seru_test_project/service/profile_service.dart';



class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchProfile>(_onFetchProfile);
  }
}



FutureOr<void> _onFetchProfile(
    FetchProfile event, Emitter<ProfileState> emit) async {
  emit(ProfileLoading());

  try {
    ProfileModel profileModel =
    await ProfileService().getProfileData();
    emit(ProfileLoadSuccess(profileModel: profileModel));
  } catch (e) {
    emit(ProfileLoadFailed(message: ''));
  }
}