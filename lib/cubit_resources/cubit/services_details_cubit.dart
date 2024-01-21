import 'package:alrashid_mall_app/api/controllers/services_details_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/services_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesDetailsCubit extends Cubit<ServicesDetailsState> {
  ServicesDetailsCubit() : super(ServicesDetailsInitial());
  bool loading = true;
  bool err = false;
  String token = '0';
  bool servicesDetailsData = false;
  bool servicesDetailsDataErr = false;
  static ServicesDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> fetchServicesDataById(BuildContext context, String token,
      {required String servicesDetailsId}) async {
    loading = true;
    err = false;
    emit(ServicesDetailsGettingLoading());

    final bool servicesDetails =
        await ServicesDetailsController.getServicesDetailsById(
            context, token, servicesDetailsId);
    if (servicesDetails) {
      loading = false;
      err = false;
      emit(ServicesDetailsFetchingOk(
          servicesDetailsModel:
              ServicesDetailsController.servicesDetailsModel));
    } else {
      loading = false;
      err = true;
      emit(ServicesDetailsFetchingErr());
    }
  }
}
