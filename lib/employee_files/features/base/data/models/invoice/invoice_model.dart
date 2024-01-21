import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';

part 'invoice_model.g.dart';

@freezed
class InvoiceModel with _$InvoiceModel {
  @JsonSerializable(explicitToJson: true)
  factory InvoiceModel({
    int? id,
    String? code,
    dynamic code_price,
    dynamic amount_before_discount,
    String? created_at,
    String? updated_at,
    int? user_id,
    int? employer_id,
    int? place_id,
    dynamic total,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
}
