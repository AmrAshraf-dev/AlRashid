
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/place/place_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/entites/place_params.dart';

import '../repositories/base_repository.dart';


class GetPlaceById extends UseCase<PlaceModel?, PlaceParams> {
  @override
  Future<PlaceModel?> call(PlaceParams params) async {
    var result = await getIt<BaseRepository>().getPlaceById(params);
    return result.fold((l) => null, (r) => r);
  }
}
