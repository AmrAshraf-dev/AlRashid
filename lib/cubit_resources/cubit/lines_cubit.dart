import 'package:alrashid_mall_app/Map_collection_package/positions_data_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/lines_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LinesCubit extends Cubit<LinesState> {
  LinesCubit() : super(LinesInitial());
  bool loading = true;
  bool err = false;
  String token = '0';

  Future<void> fetchAllLinesData(BuildContext context) async {
    loading = true;
    err = false;
    emit(LinesGettingLoading());
    final bool lines = await PositionsController.getLinesData(context);
    if (lines) {
      loading = false;
      err = false;
      emit(LinesFetchingOk(linesModel: PositionsController.lines));
    } else {
      loading = false;
      err = true;
      emit(LinesFetchingErr());
    }
  }
}
