import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/place_item/place_item.dart';

import '../repositories/repositoris.dart';

class GetPlaces extends UseCase<List<PlaceItem>, bool> {
  @override
  Future<List<PlaceItem>> call(bool params) async {
    var result = await getIt<AuthRepository>().getPlaces(params);
    return result.fold((l) => [], (r) => r);
  }
}