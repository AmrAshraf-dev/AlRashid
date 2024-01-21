
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/models/address/address_model.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';

import '../../../general/domain/entities/location_entity.dart';
import '../repositories/base_repository.dart';

class GetGeoCodeAddress extends UseCase<AddressModel?, LocationEntity> {

  @override
  Future<AddressModel?> call(LocationEntity params)async {
    var result =await getIt<BaseRepository>().getAddress(params);
    return result.fold((l) => null, (r) => r);
  }


}