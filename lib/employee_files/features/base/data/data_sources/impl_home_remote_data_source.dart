import 'package:alrashid_mall_app/employee_files/core/errors/failures.dart';
import 'package:alrashid_mall_app/employee_files/core/http/generic_http/api_names.dart';
import 'package:alrashid_mall_app/employee_files/core/http/generic_http/generic_http.dart';
import 'package:alrashid_mall_app/employee_files/core/http/models/http_request_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/place/place_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/entites/place_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../core/models/address/address_model.dart';
import '../../../general/domain/entities/location_entity.dart';
import '../../domain/entites/confirm_price_params.dart';
import '../../domain/entites/contact_us_params.dart';
import '../../domain/entites/invoice_params.dart';
import '../../domain/entites/scan_code_params.dart';
import '../../domain/entites/update_employee_profile.dart';
import '../models/employee/employee_model.dart';
import '../models/settings/settings_model.dart';
import 'home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class ImplHomeRemoteDataSource extends HomeRemoteDataSource {
  @override
  Future<Either<Failure, PlaceModel>> getPlaceById(PlaceParams param) async {
    HttpRequestModel model = HttpRequestModel(
        url: ApiNames.place + "${param.id}",
        requestMethod: RequestMethod.get,
        responseType: ResType.model,
        toJsonFunc: (json) => PlaceModel.fromJson(json),
        errorFunc: (erorr) => erorr['messge'],
        refresh: param.refresh);
    return await GenericHttpImpl<PlaceModel>()(model);
  }

  @override
  Future<Either<Failure, bool>> acceptEmployee(int params) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.acceptEmployees,
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      requestBody: {"employer_id": params},
      errorFunc: (erorr) => erorr['messge'],
      refresh: true,
      showLoader: true,
      toJsonFunc: (json) => json['messge'].contains('success'),
    );
    var result = await GenericHttpImpl<bool>()(model);
    return result;
  }

  @override
  Future<Either<Failure, bool>> refuseEmployee(int params) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.refuseEmployees,
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      requestBody: {"employer_id": params},
      errorFunc: (erorr) => erorr['messge'],
      refresh: true,
      showLoader: true,
      toJsonFunc: (json) => json['messge'].contains('success'),
    );
    var result = await GenericHttpImpl<bool>()(model);
    return result;
  }

  @override
  Future<Either<Failure, bool>> deleteEmployee(int params) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.deleteEmployees,
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      requestBody: {"employer_id": params},
      errorFunc: (erorr) => erorr['messge'],
      showLoader: true,
      toJsonFunc: (json) => json['messge'].contains('success'),
    );
    var result = await GenericHttpImpl<bool>()(model);
    return result;
  }

  @override
  Future<Either<Failure, List<EmployeeModel>>> getEmployee(bool params) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.managerEmployees,
      requestMethod: RequestMethod.post,
      responseType: ResType.list,
      responseKey: (data) => data['emplyers'],
      errorFunc: (erorr) => erorr['messge'],
      refresh: params,
      toJsonFunc: (json) =>
          List<EmployeeModel>.from(json.map((e) => EmployeeModel.fromJson(e))),
    );
    var result = await GenericHttpImpl<List<EmployeeModel>>()(model);
    return result;
  }

  @override
  Future<Either<Failure, SettingModel>> getSetting(bool param) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.settings,
      requestMethod: RequestMethod.get,
      responseType: ResType.model,
      refresh: param,
      toJsonFunc: (json) => SettingModel.fromJson(json),
    );
    return await GenericHttpImpl<SettingModel>()(model);
  }

  @override
  Future<Either<Failure, bool>> contactUs(ContactUsParams param) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.contactUs,
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      requestBody: param.toJson(),
      toJsonFunc: (json) => json['message'] != null,
    );
    return await GenericHttpImpl<bool>()(model);
  }

  @override
  Future<Either<Failure, bool>> updateEmployee(
      UpdateEmployeeParam params) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.updateEmployees,
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      errorFunc: (erorr) => erorr['messge'],
      showLoader: true,
      requestBody: params.toJson(),
      toJsonFunc: (json) => json != null,
    );
    var result = await GenericHttpImpl<bool>()(model);
    return result;
  }

  @override
  Future<Either<Failure, bool>> changeLanguage(String params) async {
    HttpRequestModel model = HttpRequestModel(
        url: ApiNames.changLang,
        requestMethod: RequestMethod.post,
        responseType: ResType.model,
        errorFunc: (error) => error['messge'],
        showLoader: false,
        toJsonFunc: (json) => json != null,
        requestBody: {"lang": params});
    return await GenericHttpImpl<bool>()(model);
  }

  @override
  Future<Either<Failure, ScanModel>> scanCode(ScanCodeParams params) async {
    HttpRequestModel model = HttpRequestModel(
        url: ApiNames.scanCode,
        requestMethod: RequestMethod.post,
        responseType: ResType.model,
        errorFunc: (error) => error['messge'],
        showLoader: false,
        toJsonFunc: (json) => ScanModel.fromJson(json),
        requestBody: params.toJson());
    return await GenericHttpImpl<ScanModel>()(model);
  }

  @override
  Future<Either<Failure, ScanModel>> confirmPrice(
      ConfirmPriceParams params) async {
    HttpRequestModel model = HttpRequestModel(
        url: ApiNames.confirmPrice,
        requestMethod: RequestMethod.post,
        responseType: ResType.model,
        errorFunc: (error) => error['messge'],
        showLoader: true,
        toJsonFunc: (json) => ScanModel.fromJson(json),
        requestBody: params.toJson());
    return await GenericHttpImpl<ScanModel>()(model);
  }

  @override
  Future<Either<Failure, bool>> shareInvoice(
      InvoiceParams params) async {
    HttpRequestModel model = HttpRequestModel(
        url: ApiNames.shareInvoice,
        requestMethod: RequestMethod.post,
        responseType: ResType.model,
        errorFunc: (error) => error['messge'],
        showLoader: false,
        toJsonFunc: (json) => json!=null,
        requestBody: params.toJson());
    return await GenericHttpImpl<bool>()(model);
  }

  @override
  Future<Either<Failure, AddressModel>> getAddress(LocationEntity param)async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.GEOCODE_URL+"${param.lat},${param.lng}?auth=${MyColors.geoCodeAuthKey}&geoit=json",
      requestMethod: RequestMethod.get,
      responseType: ResType.model,
      errorFunc: (error) => error["message"],
      showLoader: true,
      toJsonFunc: (json) => AddressModel.fromJson(json),

    );
    var data = await GenericHttpImpl<AddressModel>()(model);
    print("===============================>>data ${data.isRight()}");
    return data;

  }
}
