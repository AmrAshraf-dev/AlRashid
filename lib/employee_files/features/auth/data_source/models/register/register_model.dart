import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/login/login_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  @JsonSerializable(explicitToJson: true)
  factory RegisterModel({

    @JsonKey(name: "message_en") required String message_en,
    @JsonKey(name: "messge_ar") required String messge_ar,
    LoginModel ? user,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}