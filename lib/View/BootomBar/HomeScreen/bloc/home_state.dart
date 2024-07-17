import 'package:equatable/equatable.dart';
import 'package:seru_test_project/model/package_all_model.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoadSuccess extends HomeState {
  final PackageAllModel packageAllModel;

  const HomeLoadSuccess({required this.packageAllModel});

  @override
  List<Object> get props => [packageAllModel];
}

final class HomeLoadFailed extends HomeState {
  final String message;

  const HomeLoadFailed({required this.message});

  @override
  List<Object> get props => [message];
}
