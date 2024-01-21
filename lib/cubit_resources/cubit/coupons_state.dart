import 'package:alrashid_mall_app/models/coupons_model.dart';
import 'package:equatable/equatable.dart';

abstract class CouponsState extends Equatable {
  const CouponsState();

  @override
  List<Object> get props => [];
}

class CouponsInitial extends CouponsState {}

class CouponsGettingLoading extends CouponsState {}

class CouponsFetchingOk extends CouponsState {
  final CouponsModel couponsModel;
  const CouponsFetchingOk({required this.couponsModel});
  @override
  List<Object> get props => [couponsModel];
}

class CouponsFetchingErr extends CouponsState {}
