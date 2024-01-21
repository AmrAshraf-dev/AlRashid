import 'package:alrashid_mall_app/employee_files/core/models/user_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/register/register_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/reset_password_params.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/verify_code_params.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/place_item/place_item.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/di.dart';
import '../../../../core/usecases/use_case.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/register_params.dart';
import '../../domain/entities/update_profile_params.dart';
import '../../domain/repositories/repositoris.dart';
import '../data/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class ImplAuthRepositories extends AuthRepository {
  @override
  Future<Either<Failure, RegisterModel>> register(RegisterParams params) async {
    return await getIt<AuthRemoteDataSource>().register(params);
  }

  @override
  Future<Either<Failure, UserModel>> userLogin(LoginParams params) async {
    return await getIt<AuthRemoteDataSource>().userLogin(params);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateProfile(
      UpdateProfileParams params) async {
    return await getIt<AuthRemoteDataSource>().updateProfile(params);
  }

  @override
  Future<Either<Failure, List<PlaceItem>>> getPlaces(bool params) async {
    return await getIt<AuthRemoteDataSource>().getPlaces(params);
    //throw UnimplementedError();
  }

  @override
  Future<Either<Failure, num>> forgetPassword(String params) async {
    return await getIt<AuthRemoteDataSource>().forgetPassword(params);
  }

  @override
  Future<Either<Failure, bool>> resetPasswordByCode(
      VerifyCodeParams params) async {
    return await getIt<AuthRemoteDataSource>().resetPasswordByCode(params);
  }

  @override
  Future<Either<Failure, dynamic>> logOut(NoParams params) async {
    return await getIt<AuthRemoteDataSource>().logOut(params);
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordParams params) async {
    return await getIt<AuthRemoteDataSource>().resetPassword(params);
  }
}
