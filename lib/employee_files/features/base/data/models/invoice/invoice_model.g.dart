// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvoiceModel _$$_InvoiceModelFromJson(Map<String, dynamic> json) =>
    _$_InvoiceModel(
      id: json['id'] as int?,
      code: json['code'] as String?,
      code_price: json['code_price'],
      amount_before_discount: json['amount_before_discount'],
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      user_id: json['user_id'] as int?,
      employer_id: json['employer_id'] as int?,
      place_id: json['place_id'] as int?,
      total: json['total'],
    );

Map<String, dynamic> _$$_InvoiceModelToJson(_$_InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'code_price': instance.code_price,
      'amount_before_discount': instance.amount_before_discount,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user_id': instance.user_id,
      'employer_id': instance.employer_id,
      'place_id': instance.place_id,
      'total': instance.total,
    };
