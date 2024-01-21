
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/repositories/base_repository.dart';

import '../entites/scan_code_params.dart';


class SetScanCode extends UseCase<ScanModel?, ScanCodeParams> {

  @override
  Future<ScanModel?> call(ScanCodeParams params)async {
    var result =await getIt<BaseRepository>().scanCode(params);
    return result.fold((l) => null, (r) => r);
  }


}