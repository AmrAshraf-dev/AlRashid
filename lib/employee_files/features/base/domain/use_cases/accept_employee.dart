

import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/repositories/base_repository.dart';

class AcceptEmployee extends UseCase<bool?, int> {

  @override
  Future<bool?> call(int params)async {
    var result =await getIt<BaseRepository>().acceptEmployee(params);
    return result.fold((l) => null, (r) => r);
  }


}