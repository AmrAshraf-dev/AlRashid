
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';

import '../entities/update_profile_params.dart';
import '../repositories/repositoris.dart';

class UpdateProfile extends UseCase<Map<String,dynamic>?, UpdateProfileParams> {
  @override
  Future<Map<String,dynamic>?> call(UpdateProfileParams params) async {
    var result = await getIt<AuthRepository>().updateProfile(params);
    return result.fold((l) => null, (r) => r);
  }
}