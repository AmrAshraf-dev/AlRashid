import 'package:dartz/dartz.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/register/register_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/reset_password_params.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/verify_code_params.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/place_item/place_item.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/http/generic_http/api_names.dart';
import '../../../../core/http/generic_http/generic_http.dart';
import '../../../../core/http/models/http_request_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/usecases/use_case.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/register_params.dart';
import '../../domain/entities/update_profile_params.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class ImplAuthRemoteDataSource extends AuthRemoteDataSource {
  @override
  Future<Either<Failure, RegisterModel>> register(RegisterParams params) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.register,
      requestBody: params.toJson(),
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      errorFunc: (erorr) => erorr['message'],
      showLoader: false,
      toJsonFunc: (json) => RegisterModel.fromJson(json),
    );
    var data = GenericHttpImpl<RegisterModel>()(model);
    return data;
  }

  @override
  Future<Either<Failure, List<PlaceItem>>> getPlaces(bool param) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.places,
      requestMethod: RequestMethod.get,
      responseType: ResType.list,
      errorFunc: (error) => error["message"],
      responseKey: (data) => data['data'],
      refresh: param,
      toJsonFunc: (json) =>
          List<PlaceItem>.from(json.map((e) => PlaceItem.fromJson(e))),
    );
    return await GenericHttpImpl<List<PlaceItem>>()(model);
  }

  @override
  Future<Either<Failure, UserModel>> userLogin(LoginParams params) async {
    HttpRequestModel model = HttpRequestModel(
        url: ApiNames.login,
        requestBody: params.toJson(),
        requestMethod: RequestMethod.post,
        responseType: ResType.model,
        errorFunc: (error) => error["messge"],
        toJsonFunc: (json) => UserModel.fromJson(json),
        showLoader: false);
    var data = GenericHttpImpl<UserModel>()(model);
    return data;
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateProfile(
      UpdateProfileParams param) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.updateUser,
      requestMethod: RequestMethod.post,
      responseType: ResType.model,
      errorFunc: (error) => error["message"],
      requestBody: param.toJson(),
      showLoader: false,
      toJsonFunc: (json) => json,
    );
    return await GenericHttpImpl<Map<String, dynamic>>()(model);
  }

  @override
  Future<Either<Failure, num>> forgetPassword(String params) async {
    HttpRequestModel model = HttpRequestModel(
        url: ApiNames.forgetPassword,
        requestBody: {"email": params},
        requestMethod: RequestMethod.post,
        toJsonFunc: (json) => json["code"],
        responseType: ResType.model,
        errorFunc: (error) => error["message"],
        showLoader: false);
    return await GenericHttpImpl<num>()(model);
  }

  @override
  Future<Either<Failure, bool>> resetPasswordByCode(
      VerifyCodeParams params) async {
    HttpRequestModel model = HttpRequestModel(
      requestBody: params.toJson(),
      url: ApiNames.resetPasswordByCode,
      requestMethod: RequestMethod.post,
      toJsonFunc: (json) => json["message"] != null,
      responseType: ResType.model,
      errorFunc: (error) => error["message"],
      showLoader: false,
    );
    return await GenericHttpImpl<bool>()(model);
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordParams params) async {
    HttpRequestModel model = HttpRequestModel(
      requestBody: params.toJson(),
      url: ApiNames.resetPassword,
      requestMethod: RequestMethod.post,
      toJsonFunc: (json) => json["message"] != null,
      responseType: ResType.model,
      errorFunc: (error) => error["message"],
      showLoader: false,
    );
    return await GenericHttpImpl<bool>()(model);
  }

  @override
  Future<Either<Failure, dynamic>> logOut(NoParams params) async {
    HttpRequestModel model = HttpRequestModel(
      url: ApiNames.logout,
      requestMethod: RequestMethod.post,
      responseType: ResType.type,
      errorFunc: (error) => error['message'],
      toJsonFunc: (json) => json["message"] != null,
      showLoader: true,
    );
    return await GenericHttpImpl<dynamic>()(model);
  }
}
