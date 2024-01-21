// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScanModel _$$_ScanModelFromJson(Map<String, dynamic> json) => _$_ScanModel(
      invoice: json['invoice'] == null
          ? null
          : InvoiceModel.fromJson(json['invoice'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : LoginModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScanModelToJson(_$_ScanModel instance) =>
    <String, dynamic>{
      'invoice': instance.invoice?.toJson(),
      'user': instance.user?.toJson(),
    };
