import 'dart:async';

import 'package:equatable/equatable.dart';

abstract class VerfiyState extends Equatable {
  const VerfiyState();

  @override
  List<Object> get props => [];
}

class VerfiyInitial extends VerfiyState {}

class VerfiyTimerCancel extends VerfiyState {
  final Timer timer;
  const VerfiyTimerCancel({required this.timer});
   @override
  List<Object> get props => [timer];
}

class VerfiyTimerMinus extends VerfiyState {
  final int time;
  const VerfiyTimerMinus({required this.time});
   @override
  List<Object> get props => [time];
}

class VerfiyTimerReset extends VerfiyState {
  final int time;
  const VerfiyTimerReset({required this.time});
   @override
  List<Object> get props => [time];
}
