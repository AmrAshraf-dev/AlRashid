// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmploymentModel _$$_EmploymentModelFromJson(Map<String, dynamic> json) =>
    _$_EmploymentModel(
      emplyer: json['emplyer'] == null
          ? null
          : EmployeeModel.fromJson(json['emplyer'] as Map<String, dynamic>),
      messge: json['messge'] as String?,
    );

Map<String, dynamic> _$$_EmploymentModelToJson(_$_EmploymentModel instance) =>
    <String, dynamic>{
      'emplyer': instance.emplyer?.toJson(),
      'messge': instance.messge,
    };
