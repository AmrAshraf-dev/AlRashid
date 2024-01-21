

import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/repositories/base_repository.dart';

import '../entites/invoice_params.dart';


class ShareInvoice extends UseCase<bool, InvoiceParams> {

  @override
  Future<bool> call(InvoiceParams params)async {
    var result =await getIt<BaseRepository>().shareInvoice(params);
    return result.fold((l) => false, (r) => r);
  }


}