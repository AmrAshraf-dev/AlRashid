
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/repositories/base_repository.dart';

import '../../data/models/employee/employee_model.dart';


class GetEmployee extends UseCase<List<EmployeeModel>, bool> {

  @override
  Future<List<EmployeeModel>> call(bool params)async {
    var result =await getIt<BaseRepository>().getEmployee(params);
    return result.fold((l) => [], (r) => r);
  }


}