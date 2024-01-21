import 'package:dartz/dartz.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/reset_password_params.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/verify_code_params.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/place_item/place_item.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/usecases/use_case.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/register_params.dart';
import '../../domain/entities/update_profile_params.dart';
import '../models/register/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, RegisterModel>> register(RegisterParams params);
  Future<Either<Failure, num>> forgetPassword(String params);
  Future<Either<Failure, bool>> resetPasswordByCode(VerifyCodeParams params);
  Future<Either<Failure, bool>> resetPassword(ResetPasswordParams params);
  Future<Either<Failure, dynamic>> logOut(NoParams params);

  Future<Either<Failure, UserModel>> userLogin(LoginParams params);
  Future<Either<Failure, Map<String, dynamic>>> updateProfile(
      UpdateProfileParams params);
  Future<Either<Failure, List<PlaceItem>>> getPlaces(bool params);
}
