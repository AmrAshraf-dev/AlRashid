import 'package:alrashid_mall_app/models/shop_position.dart';
import 'package:equatable/equatable.dart';

abstract class PositionsState extends Equatable {
  const PositionsState();

  @override
  List<Object> get props => [];
}

class PositionsInitial extends PositionsState {}

class PositionsGettingLoading extends PositionsState {}

class PositionsFetchingOk extends PositionsState {
  final List<ShopPositionModel> shopPositionsModel;
  const PositionsFetchingOk({required this.shopPositionsModel});
  @override
  List<Object> get props => [ShopPositionModel];
}

class PositionsFetchingErr extends PositionsState {}
