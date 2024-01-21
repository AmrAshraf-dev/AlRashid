import 'package:alrashid_mall_app/employee_files/features/general/domain/entities/location_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  onLocationUpdated(LocationEntity model){
    emit(LocationUpdated(model, state.changed));
  }

}
