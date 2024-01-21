// import 'package:flutter_tdd/core/helpers/di.dart';
// import 'package:flutter_tdd/core/usecases/use_case.dart';
// import 'package:flutter_tdd/features/base/domain/repositories/base_repository.dart';
//
// import '../entites/confirm_price_params.dart';
// import '../entites/scan_code_params.dart';
//
//
// class SetQrCode extends UseCase<bool, String> {
//
//   @override
//   Future<bool> call(String params)async {
//     var result =await getIt<BaseRepository>().qrCode(params);
//     return result.fold((l) => false, (r) => r);
//   }
//
//
// }