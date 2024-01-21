
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/repositories/base_repository.dart';

import '../entites/confirm_price_params.dart';


class SetConfirmPrice extends UseCase<ScanModel?, ConfirmPriceParams> {

  @override
  Future<ScanModel?> call(ConfirmPriceParams params)async {
    var result =await getIt<BaseRepository>().confirmPrice(params);
    return result.fold((l) => null, (r) => r);
  }


}