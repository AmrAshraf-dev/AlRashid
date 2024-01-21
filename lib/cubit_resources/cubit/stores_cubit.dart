import 'package:alrashid_mall_app/api/controllers/stroes_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/stores_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class StoresCubit extends Cubit<StoresState> {
  StoresCubit() : super(StoresInitial());
  bool loading = true;
  bool err = false;
  String token = '0';

  Future<void> fetchAllStoresData(BuildContext context, String token) async {
    loading = true;
    err = false;
    emit(StoresGettingLoading());
    final bool stores = await StoresController.getStoresData(context, token);
    if (stores) {
      loading = false;
      err = false;
      emit(StoresFetchingOk(storesModel: StoresController.storesModel));
    } else {
      loading = false;
      err = true;
      emit(StoresFetchingErr());
    }
  }
}
