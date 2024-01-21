// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterModel _$$_RegisterModelFromJson(Map<String, dynamic> json) =>
    _$_RegisterModel(
      message_en: json['message_en'] as String,
      messge_ar: json['messge_ar'] as String,
      user: json['user'] == null
          ? null
          : LoginModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RegisterModelToJson(_$_RegisterModel instance) =>
    <String, dynamic>{
      'message_en': instance.message_en,
      'messge_ar': instance.messge_ar,
      'user': instance.user?.toJson(),
    };
