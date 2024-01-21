import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import '../../data/models/settings/settings_model.dart';
import '../repositories/base_repository.dart';


class GetSettings extends UseCase<SettingModel?, bool> {
  @override
  Future<SettingModel?> call(bool params) async {
    var result = await getIt<BaseRepository>().getSetting(params);
    return result.fold((l) => null, (r) => r);
  }
}
