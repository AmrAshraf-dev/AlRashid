import 'package:alrashid_mall_app/models/user_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersGettingLoading extends UsersState {}

class UsersFetchingOk extends UsersState {
  final UserDataModel userDataModel;
  const UsersFetchingOk({required this.userDataModel});
  @override
  List<Object> get props => [userDataModel];
}

class UsersFetchingErr extends UsersState {}
