import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:seru_test_project/View/BootomBar/HomeScreen/bloc/home_event.dart';
import 'package:seru_test_project/View/BootomBar/HomeScreen/bloc/home_state.dart';
import 'package:seru_test_project/model/package_all_model.dart';
import 'package:seru_test_project/service/home_service.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchPackage>(_onFetchPackage);
  }
}



FutureOr<void> _onFetchPackage(
    FetchPackage event, Emitter<HomeState> emit) async {
  emit(HomeLoading());

  try {
    PackageAllModel packageAllModel =
    await HomeService().getPackageAllData();
    emit(HomeLoadSuccess(packageAllModel: packageAllModel));
  } catch (e) {
    emit(HomeLoadFailed(message: ''));
  }
}