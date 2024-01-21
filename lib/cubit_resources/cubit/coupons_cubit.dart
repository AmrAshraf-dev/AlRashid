import 'package:alrashid_mall_app/api/controllers/coupons_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/coupons_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit() : super(CouponsInitial());
  bool loading = true;
  bool err = false;
  String token = '0';

  Future<void> fetchAllCouponsData(BuildContext context, String token) async {
    loading = true;
    err = false;
    emit(CouponsGettingLoading());
    final bool coupons = await CouponsController.getCouponsData(context, token);
    if (coupons) {
      loading = false;
      err = false;
      emit(CouponsFetchingOk(couponsModel: CouponsController.couponsModel));
    } else {
      loading = false;
      err = true;
      emit(CouponsFetchingErr());
    }
  }
}
