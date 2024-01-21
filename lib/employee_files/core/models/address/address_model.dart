import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel{

  @JsonSerializable(explicitToJson: true)
  factory AddressModel({
    @JsonKey(name: "staddress", defaultValue: "")  dynamic street,
    @JsonKey(name: "city", defaultValue: "") required String city,
    @JsonKey(name: "country", defaultValue: "") required String country,
    @JsonKey(name: "region", defaultValue: "")  String? region,
    @JsonKey(name: "state", defaultValue: "")  String? state,
    @JsonKey(name: "prov", defaultValue: "")  String? prov,
    @JsonKey(name: "longt", defaultValue: "") required String longt,
    @JsonKey(name: "latt", defaultValue: "") required String latt,
  }) = _AddressModel;


  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);


  }
