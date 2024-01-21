
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';

import '../entites/contact_us_params.dart';
import '../repositories/base_repository.dart';

class SetContactUs extends UseCase<bool, ContactUsParams> {
  @override
  Future<bool> call(ContactUsParams params) async {
    var result = await getIt<BaseRepository>().contactUs(params);
    return result.fold((l) => false, (r) => r);
  }
}
