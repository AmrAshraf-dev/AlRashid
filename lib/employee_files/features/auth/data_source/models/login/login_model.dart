
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  @JsonSerializable(explicitToJson: true)
  factory LoginModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") dynamic phone,
    @JsonKey(name: "start_work") String? start_work,
    @JsonKey(name: "end_work") String? end_work,
    @JsonKey(name: "updated_at") String? updated_at,
    @JsonKey(name: "created_at") String? created_at,
    @JsonKey(name: "national_id") String? national_id,
    @JsonKey(name: "lang") String? lang,
    @JsonKey(name: "place_id") dynamic place_id,
    @JsonKey(name: "manger") dynamic manger,
    @JsonKey(nullable: true,ignore: true) String? name_ar,
    @JsonKey(nullable: true,ignore: true) String? name_en,
    int? type,

  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
