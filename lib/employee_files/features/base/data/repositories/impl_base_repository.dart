import 'package:alrashid_mall_app/employee_files/core/errors/failures.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/place/place_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/entites/place_params.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/repositories/base_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/models/address/address_model.dart';
import '../../../general/domain/entities/location_entity.dart';
import '../../domain/entites/confirm_price_params.dart';
import '../../domain/entites/contact_us_params.dart';
import '../../domain/entites/invoice_params.dart';
import '../../domain/entites/scan_code_params.dart';
import '../../domain/entites/update_employee_profile.dart';
import '../data_sources/home_remote_data_source.dart';
import '../models/employee/employee_model.dart';
import '../models/settings/settings_model.dart';

@Injectable(as: BaseRepository)
class ImplBaseRepository extends BaseRepository {



  @override
  Future<Either<Failure, bool>> acceptEmployee(int param)async {
    return await getIt<HomeRemoteDataSource>().acceptEmployee(param);
  }
@override
  Future<Either<Failure, bool>> refuseEmployee(int param)async {
    return await getIt<HomeRemoteDataSource>().refuseEmployee(param);
  }

@override
  Future<Either<Failure, bool>> deleteEmployee(int param)async {
    return await getIt<HomeRemoteDataSource>().deleteEmployee(param);
  }
  @override
  Future<Either<Failure, bool>> updateEmployee(UpdateEmployeeParam param)async {
    return await getIt<HomeRemoteDataSource>().updateEmployee(param);
  }
  @override
  Future<Either<Failure, bool>> changeLanguage(String param)async {
    return await getIt<HomeRemoteDataSource>().changeLanguage(param);
  }
@override
  Future<Either<Failure, List<EmployeeModel>>> getEmployee(bool param)async {
    return await getIt<HomeRemoteDataSource>().getEmployee(param);
  }

@override
  Future<Either<Failure, SettingModel>> getSetting(bool param)async {
    return await getIt<HomeRemoteDataSource>().getSetting(param);
  }
@override
  Future<Either<Failure, bool>> contactUs(ContactUsParams param)async {
    return await getIt<HomeRemoteDataSource>().contactUs(param);
  }

  @override
  Future<Either<Failure, PlaceModel>> getPlaceById(PlaceParams param)async{
    return await getIt<HomeRemoteDataSource>().getPlaceById(param);
  }
@override
  Future<Either<Failure, ScanModel>> scanCode(ScanCodeParams param)async{
    return await getIt<HomeRemoteDataSource>().scanCode(param);
  }

@override
  Future<Either<Failure, ScanModel>> confirmPrice(ConfirmPriceParams param)async{
    return await getIt<HomeRemoteDataSource>().confirmPrice(param);
  }
@override
  Future<Either<Failure, bool>> shareInvoice(InvoiceParams param)async{
    return await getIt<HomeRemoteDataSource>().shareInvoice(param);
  }

  @override
  Future<Either<Failure, AddressModel>> getAddress(LocationEntity param)async {
    return getIt<HomeRemoteDataSource>().getAddress(param);
  }

}