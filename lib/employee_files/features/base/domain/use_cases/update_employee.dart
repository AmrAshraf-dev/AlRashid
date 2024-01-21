
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/repositories/base_repository.dart';

import '../entites/update_employee_profile.dart';


class UpdateEmployee extends UseCase<bool, UpdateEmployeeParam> {

  @override
  Future<bool> call(UpdateEmployeeParam params)async {
    var result =await getIt<BaseRepository>().updateEmployee(params);
    return result.fold((l) => false, (r) => r);
  }


}