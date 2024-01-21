import 'package:alrashid_mall_app/models/stores_details_model.dart';
import 'package:equatable/equatable.dart';

abstract class StoresDetailsState extends Equatable {
  const StoresDetailsState();

  @override
  List<Object> get props => [];
}

class StoresDetailsInitial extends StoresDetailsState {}

class StoresDetailsGettingLoading extends StoresDetailsState {}

class StoresDetailsFetchingOk extends StoresDetailsState {
  final MySinglePlaceModel mySinglePlaceModel;
  const StoresDetailsFetchingOk({required this.mySinglePlaceModel});
  @override
  List<Object> get props => [mySinglePlaceModel];
}

class StoresDetailsFetchingErr extends StoresDetailsState {}
