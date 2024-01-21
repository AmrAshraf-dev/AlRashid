
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/register/register_model.dart';

import '../entities/register_params.dart';
import '../repositories/repositoris.dart';

class SetRegister extends UseCase<RegisterModel?, RegisterParams> {
  @override
  Future<RegisterModel?> call(RegisterParams params) async {
    var result = await getIt<AuthRepository>().register(params);
    print("=========>> result $result");
    print("=========>> params ${params.toJson()}");
    if(result.isLeft())return null;
    return result.fold((l) => null, (r) => r);
  }
}