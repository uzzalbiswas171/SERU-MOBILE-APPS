import 'package:equatable/equatable.dart';
import 'package:seru_test_project/model/banner_model.dart';
import 'package:seru_test_project/model/package_all_model.dart';

sealed class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerLoadSuccess extends BannerState {
  final BannerModel bannerModel;

  const BannerLoadSuccess({required this.bannerModel});

  @override
  List<Object> get props => [bannerModel];
}

final class BannerLoadFailed extends BannerState {
  final String message;

  const BannerLoadFailed({required this.message});

  @override
  List<Object> get props => [message];
}
