import 'package:alrashid_mall_app/employee_files/core/errors/failures.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/place/place_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/entites/place_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/address/address_model.dart';
import '../../../general/domain/entities/location_entity.dart';
import '../../data/models/employee/employee_model.dart';
import '../../data/models/settings/settings_model.dart';
import '../entites/confirm_price_params.dart';
import '../entites/contact_us_params.dart';
import '../entites/invoice_params.dart';
import '../entites/scan_code_params.dart';
import '../entites/update_employee_profile.dart';

abstract class BaseRepository {
  Future<Either<Failure,PlaceModel>> getPlaceById(PlaceParams param);
  Future<Either<Failure,bool>> acceptEmployee(int param);
  Future<Either<Failure,bool>> refuseEmployee(int param);
  Future<Either<Failure,bool>> deleteEmployee(int param);
  Future<Either<Failure,bool>> updateEmployee(UpdateEmployeeParam param);
  Future<Either<Failure,bool>> changeLanguage(String param);
  Future<Either<Failure,bool>> contactUs(ContactUsParams param);
  Future<Either<Failure,List<EmployeeModel>>> getEmployee(bool param);
  Future<Either<Failure,SettingModel>> getSetting(bool param);
  Future<Either<Failure,ScanModel>> scanCode(ScanCodeParams param);
  Future<Either<Failure,ScanModel>> confirmPrice(ConfirmPriceParams param);
  Future<Either<Failure,bool>> shareInvoice(InvoiceParams param);
  Future<Either<Failure, AddressModel>> getAddress(LocationEntity param);


}