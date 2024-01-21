import 'package:alrashid_mall_app/models/all_events_model.dart';
import 'package:equatable/equatable.dart';

abstract class AllEventsState extends Equatable {
  const AllEventsState();

  @override
  List<Object> get props => [];
}

class AllEventsInitial extends AllEventsState {}

class AllEventsGettingLoading extends AllEventsState {}

class AllEventsFetchingOk extends AllEventsState {
  final AllEventsModel allEventsModel;
  const AllEventsFetchingOk({required this.allEventsModel,});
  @override
  List<Object> get props => [allEventsModel];
}

class AllEventsFetchingErr extends AllEventsState {}
