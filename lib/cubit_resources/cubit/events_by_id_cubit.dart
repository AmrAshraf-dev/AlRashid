import 'package:alrashid_mall_app/api/controllers/all_events_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/events_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsByIdCubit extends Cubit<EventsByIdState> {
  EventsByIdCubit() : super(EventsByIdInitial());
  bool loading = true;
  bool err = false;
  String token = '0';
  bool evetnsData = false;
  bool eventsDataErr = false;
  static EventsByIdCubit get(context) => BlocProvider.of(context);

  Future<void> fetchEventsDataById(BuildContext context, String token,
       {required String eventId}) async {
    loading = true;
    err = false;
    emit(EventsByIdGettingLoading());
   
    final bool eventsById =
        await AllEventsController.getEventsById(context, token, eventId);
    if (eventsById) {
      loading = false;
      err = false;
      emit(EventsByIdFetchingOk(
          eventsByIdModel: AllEventsController.eventsByIdModel));
    } else {
      loading = false;
      err = true;
      emit(EventsByIdFetchingErr());
    }
   
  }
}
