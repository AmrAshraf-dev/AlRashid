part of 'setting_cubit.dart';

abstract class SettingState extends Equatable {
  final SettingModel? model;
  final bool changed;
  const SettingState( { this.model,required this.changed});
}

class SettingInitial extends SettingState {
  const SettingInitial() : super(changed: false);

  @override
  List<Object> get props => [changed];
}
class SettingUpdateState extends SettingState {
  const SettingUpdateState({required SettingModel? model,required bool changed})
      : super(model: model,changed: false);

  @override
  List<Object> get props => [changed];
}
