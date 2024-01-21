import 'dart:async';

import 'package:bloc/bloc.dart';

import 'verfiy_state.dart';

class VerfiyCubit extends Cubit<VerfiyState> {
  VerfiyCubit() : super(VerfiyInitial());

  late Timer timer;
  int start = 60;

  initBloc() {
    emit(VerfiyInitial());
    resetTimer();
  }

  void startTimer() {
    var oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          emit(VerfiyTimerCancel(timer: timer));
        } else {
          start--;
          emit(VerfiyTimerMinus(time: start));
        }
      },
    );
  }

  void resetTimer() {
    start = 60;
    emit(VerfiyTimerReset(time: start));
    startTimer();
  }
}
