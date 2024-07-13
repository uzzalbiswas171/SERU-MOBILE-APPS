import 'package:equatable/equatable.dart';
import 'package:seru_test_project/model/package_all_model.dart';
import 'package:seru_test_project/model/profile_model.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoadSuccess extends ProfileState {
  final ProfileModel profileModel;

  const ProfileLoadSuccess({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

final class ProfileLoadFailed extends ProfileState {
  final String message;

  const ProfileLoadFailed({required this.message});

  @override
  List<Object> get props => [message];
}
