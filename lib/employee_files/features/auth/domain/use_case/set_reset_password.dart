import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/reset_password_params.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/repositories/repositoris.dart';

class SetResetPassword extends UseCase<bool?, ResetPasswordParams> {
  @override
  Future<bool?> call(ResetPasswordParams params) async {
    var result = await getIt<AuthRepository>().resetPassword(params);
    return result.fold((l) => null, (r) => r);
  }
}