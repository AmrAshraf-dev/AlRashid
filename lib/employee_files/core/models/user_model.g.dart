// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      token: json['access_token'] == null
          ? null
          : TokenModel.fromJson(json['access_token'] as Map<String, dynamic>),
      token_type: json['token_type'] as String?,
      user: json['user'] == null
          ? null
          : LoginModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'access_token': instance.token?.toJson(),
      'token_type': instance.token_type,
      'user': instance.user?.toJson(),
    };
