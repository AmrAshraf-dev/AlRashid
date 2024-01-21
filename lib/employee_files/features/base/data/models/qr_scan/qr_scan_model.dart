import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/login/login_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scan_model.freezed.dart';
part 'qr_scan_model.g.dart';

@freezed
class QrScanModel with _$QrScanModel{
  @JsonSerializable(explicitToJson: true)
  factory QrScanModel({
    LoginModel? user,
    String?messge,
  }) = _QrScanModel;


  factory QrScanModel.fromJson(Map<String, dynamic> json) =>
      _$QrScanModelFromJson(json);
}