import 'dart:developer';

import 'package:alrashid_mall_app/Map_collection_package/positions_data_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/positions_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class PoistionsCubit extends Cubit<PositionsState> {
  PoistionsCubit() : super(PositionsInitial());
  bool loading = true;
  bool err = false;
  String token = '0';

  Future<void> fetchAllPositionsData(BuildContext context, int floor) async {
    log('myLoadingFetch');
    loading = true;
    err = false;
    emit(PositionsGettingLoading());
    final bool positions =
        await PositionsController.getPositionsData(context, floor: floor);
    if (positions) {
      loading = false;
      err = false;
      emit(PositionsFetchingOk(
          shopPositionsModel: PositionsController.shopPostionModel));
      // print(
      //     'shops position model ==<><>m7lat${PositionsController.shopPostionModel.first.toJson()}');

      for (var element in PositionsController.shopPostionModel) {
        print('shops position model ==<><>m7lat : ${element.toJson()}');
      }
    } else {
      loading = false;
      err = true;
      emit(PositionsFetchingErr());
    }
  }
}
