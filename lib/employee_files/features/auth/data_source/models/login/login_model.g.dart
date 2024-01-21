// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginModel _$$_LoginModelFromJson(Map<String, dynamic> json) =>
    _$_LoginModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'],
      start_work: json['start_work'] as String?,
      end_work: json['end_work'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      national_id: json['national_id'] as String?,
      lang: json['lang'] as String?,
      place_id: json['place_id'],
      manger: json['manger'],
      type: json['type'] as int?,
    );

Map<String, dynamic> _$$_LoginModelToJson(_$_LoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'start_work': instance.start_work,
      'end_work': instance.end_work,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'national_id': instance.national_id,
      'lang': instance.lang,
      'place_id': instance.place_id,
      'manger': instance.manger,
      'type': instance.type,
    };
