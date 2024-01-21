
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/place/place_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  @JsonSerializable(explicitToJson: true)
  factory TokenModel({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "place") Place? place
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}
