import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../base/data/models/settings/settings_model.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(const SettingInitial());
  onUpdateSettingData(SettingModel model){
    emit(SettingUpdateState(model: model,changed: state.changed));
  }

}
