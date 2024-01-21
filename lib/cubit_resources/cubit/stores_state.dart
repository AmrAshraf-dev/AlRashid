import 'package:alrashid_mall_app/models/Stores_model.dart';
import 'package:equatable/equatable.dart';

abstract class StoresState extends Equatable {
  const StoresState();

  @override
  List<Object> get props => [];
}

class StoresInitial extends StoresState {}

class StoresGettingLoading extends StoresState {}

class StoresFetchingOk extends StoresState {
  final StoresModel storesModel;
  const StoresFetchingOk({required this.storesModel});
  @override
  List<Object> get props => [storesModel];
}

class StoresFetchingErr extends StoresState {}
