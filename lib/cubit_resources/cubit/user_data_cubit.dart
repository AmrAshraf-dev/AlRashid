import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/user_data_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  bool loading = true;
  bool err = false;
  String token = '0';
  String? hintText;

  Future<void> fetchAllUsersData(BuildContext context, String token) async {
    loading = true;
    err = false;
    emit(UsersGettingLoading());
    final bool users = await AuthController.getUserData(context, token);
    if (users) {
      loading = false;
      err = false;
      emit(UsersFetchingOk(userDataModel: AuthController.userDataModel));
    } else {
      loading = false;
      err = true;
      emit(UsersFetchingErr());
    }
  }
}
