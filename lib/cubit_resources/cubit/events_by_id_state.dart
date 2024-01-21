import 'package:alrashid_mall_app/models/all_events_model.dart';
import 'package:equatable/equatable.dart';

abstract class EventsByIdState extends Equatable {
  const EventsByIdState();

  @override
  List<Object> get props => [];
}

class EventsByIdInitial extends EventsByIdState {}

class EventsByIdGettingLoading extends EventsByIdState {}

class EventsByIdFetchingOk extends EventsByIdState {
  final EventsByIdModel eventsByIdModel;
  const EventsByIdFetchingOk({
    required this.eventsByIdModel,
  });
  @override
  List<Object> get props => [eventsByIdModel];
  
}

class EventsByIdFetchingErr extends EventsByIdState {}
