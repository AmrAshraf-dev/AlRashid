import 'package:alrashid_mall_app/models/services_details_model.dart';
import 'package:equatable/equatable.dart';

abstract class ServicesDetailsState extends Equatable {
  const ServicesDetailsState();

  @override
  List<Object> get props => [];
}

class ServicesDetailsInitial extends ServicesDetailsState {}

class ServicesDetailsGettingLoading extends ServicesDetailsState {}

class ServicesDetailsFetchingOk extends ServicesDetailsState {
  final ServicesDetailsModel servicesDetailsModel;
  const ServicesDetailsFetchingOk({
    required this.servicesDetailsModel,
  });
  @override
  List<Object> get props => [servicesDetailsModel];
}

class ServicesDetailsFetchingErr extends ServicesDetailsState {}
