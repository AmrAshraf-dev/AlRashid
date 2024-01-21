import 'package:alrashid_mall_app/employee_files/core/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitial());

  onUpdateUserData(UserModel model){
    emit(UserUpdateState(model: model, changed: !state.changed));
  }

}
