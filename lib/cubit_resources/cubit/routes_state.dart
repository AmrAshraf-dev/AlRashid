import 'package:alrashid_mall_app/models/route_position.dart';
import 'package:alrashid_mall_app/models/shop_position.dart';
import 'package:equatable/equatable.dart';

abstract class RoutesState extends Equatable {
  const RoutesState();

  @override
  List<Object> get props => [];
}

class RoutesInitial extends RoutesState {}

class RoutesGettingLoading extends RoutesState {}

class RoutesFetchingOk extends RoutesState {
  final List<RoutePositionModel> routePositionModel;
  const RoutesFetchingOk({required this.routePositionModel});
  @override
  List<Object> get props => [ShopPositionModel];
}

class RoutesFetchingErr extends RoutesState {}
