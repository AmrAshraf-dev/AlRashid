import 'package:alrashid_mall_app/Map_collection_package/positions_data_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/routes_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class RoutesCubit extends Cubit<RoutesState> {
  RoutesCubit() : super(RoutesInitial());
  bool loading = true;
  bool err = false;
  String token = '0';

  Future<void> fetchAllRoutesData(
      BuildContext context, int fromId, int toId, int floor) async {
    loading = true;
    err = false;
    emit(RoutesGettingLoading());
    final bool routes = await PositionsController.getRoutesData(context,
        fromId: fromId, toId: toId, floor: floor);
    if (routes) {
      loading = false;
      err = false;
      emit(RoutesFetchingOk(
          routePositionModel: PositionsController.routePositionModel));
      print(
          'route position model ==<><>${PositionsController.routePositionModel.first.toJson()}');
    } else {
      loading = false;
      err = true;
      emit(RoutesFetchingErr());
    }
  }

  emptyRoutes() {
    emit(RoutesInitial());
  }
}
