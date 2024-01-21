import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/login/token_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/data_source/models/login/login_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel{
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    @JsonKey(name: "access_token")  TokenModel? token,
    @JsonKey(name: "token_type")  String? token_type,
    LoginModel? user,
  }) = _UserModel;


  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}