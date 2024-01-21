// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QrScanModel _$$_QrScanModelFromJson(Map<String, dynamic> json) =>
    _$_QrScanModel(
      user: json['user'] == null
          ? null
          : LoginModel.fromJson(json['user'] as Map<String, dynamic>),
      messge: json['messge'] as String?,
    );

Map<String, dynamic> _$$_QrScanModelToJson(_$_QrScanModel instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'messge': instance.messge,
    };
