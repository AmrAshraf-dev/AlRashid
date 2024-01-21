import 'package:alrashid_mall_app/api/controllers/all_events_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/all_events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllEventsCubit extends Cubit<AllEventsState> {
  AllEventsCubit() : super(AllEventsInitial());
  static AllEventsCubit get(context) => BlocProvider.of(context);
  
  bool loading = true;
  bool err = false;
  String token = '0';
  bool evetnsData = false;
  bool eventsDataErr = false;

  Future<void> fetchAllEventsData(BuildContext context, String token) async {
    loading = true;
    err = false;
    emit(AllEventsGettingLoading());
    final bool allEvents =
        await AllEventsController.getAllEventsData(context, token);
    if (allEvents) {
      loading = false;
      err = false;
      emit(AllEventsFetchingOk(
          allEventsModel: AllEventsController.allEventsModel));
    } else {
      loading = false;
      err = true;
      emit(AllEventsFetchingErr());
    }
  }
}
