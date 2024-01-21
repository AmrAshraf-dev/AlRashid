import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/models/user_model.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/login_params.dart';


import '../repositories/repositoris.dart';

class SetUserLogin extends UseCase<UserModel?, LoginParams> {
  @override
  Future<UserModel?> call(LoginParams params) async {
    var result = await getIt<AuthRepository>().userLogin(params);
    print("result $result");
    return result.fold((l) => null, (r) => r);
  }
}