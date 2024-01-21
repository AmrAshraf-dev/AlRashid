
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/verify_code_params.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/repositories/repositoris.dart';

class SetResetPasswordByCode extends UseCase<bool?, VerifyCodeParams> {
  @override
  Future<bool?> call(VerifyCodeParams params) async {
    var result = await getIt<AuthRepository>().resetPasswordByCode(params);
    return result.fold((l) => null, (r) => r);
  }
}