import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/repositories/repositoris.dart';

class SetForgetPassword extends UseCase<num?, String> {
  @override
  Future<num?> call(String params) async {
    var result = await getIt<AuthRepository>().forgetPassword(params);
    return result.fold((l) => null, (r) => r);
  }
}
