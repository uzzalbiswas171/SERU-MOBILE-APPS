import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:seru_test_project/model/banner_model.dart';
import 'package:seru_test_project/service/home_service.dart';

import 'banner_event.dart';
import 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    on<FetchBanner>(_onFetchBanner);
  }
}

FutureOr<void> _onFetchBanner(
    FetchBanner event, Emitter<BannerState> emit) async {
  emit(BannerLoading());

  try {
    BannerModel bannerModel = await HomeService().getAllBanner();
    emit(BannerLoadSuccess(bannerModel: bannerModel));
  } catch (e) {
    emit(BannerLoadFailed(message: ''));
  }
}
