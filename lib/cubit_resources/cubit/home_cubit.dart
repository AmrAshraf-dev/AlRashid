import 'package:alrashid_mall_app/api/controllers/home_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  bool loading = true;
  bool err = false;
  String token = '0';
  bool evetnsData = false;
  bool eventsDataErr = false;
  bool services = false;
  bool servicesErr = false;
  bool sliders = false;
  bool slidersErr = false;

  Future<void> fetchAllData(BuildContext context, String token) async {
    loading = true;
    err = false;
    emit(HomeGettingLoading());
    final bool home = await HomeController.getHomeData(context, token);
    if (home) {
      loading = false;
      err = false;
      emit(HomeFetchingOk(homeModel: HomeController.homeModel));
    } else {
      loading = false;
      err = true;
      emit(HomeFetchingErr());
    }
  }
}
