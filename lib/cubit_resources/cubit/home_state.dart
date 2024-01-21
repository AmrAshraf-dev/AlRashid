import 'package:alrashid_mall_app/models/home_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeGettingLoading extends HomeState {}

class HomeFetchingOk extends HomeState {
  // final KnwatProductModel knwatProductModel;
  final HomeModel homeModel;
  const HomeFetchingOk({required this.homeModel, homeProductModel});
  @override
  List<Object> get props => [homeModel];
}

class HomeFetchingErr extends HomeState {}
