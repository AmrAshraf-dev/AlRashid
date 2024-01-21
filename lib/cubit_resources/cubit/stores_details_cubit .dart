import 'package:alrashid_mall_app/api/controllers/stroes_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/stores_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoresDetailsCubit extends Cubit<StoresDetailsState> {
  StoresDetailsCubit() : super(StoresDetailsInitial());
  bool loading = true;
  bool err = false;
  String token = '0';
  bool storesDetailsData = false;
  bool storesDetailsDataErr = false;
  static StoresDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> fetchStoresDetailsData(BuildContext context, String token,
      {required String storesDetailsId}) async {
    loading = true;
    err = false;
    emit(StoresDetailsGettingLoading());

    final bool storesDetails =
        await StoresController.getStoresDetails(
            context, token, storesDetailsId);
    if (storesDetails) {
      loading = false;
      err = false;
      emit(StoresDetailsFetchingOk(
          mySinglePlaceModel:
              StoresController.mySinglePlaceModel));
    } else {
      loading = false;
      err = true;
      emit(StoresDetailsFetchingErr());
    }
  }
}
