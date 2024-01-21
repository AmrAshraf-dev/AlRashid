import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/login/login_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/invoice/invoice_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_model.freezed.dart';
part 'scan_model.g.dart';

@freezed
class ScanModel with _$ScanModel{
  @JsonSerializable(explicitToJson: true)
  factory ScanModel({
    InvoiceModel? invoice ,
    LoginModel? user




  }) = _ScanModel;


  factory ScanModel.fromJson(Map<String, dynamic> json) =>
      _$ScanModelFromJson(json);
}