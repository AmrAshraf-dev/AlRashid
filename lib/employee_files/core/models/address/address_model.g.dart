// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      street: json['staddress'] ?? '',
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
      region: json['region'] as String? ?? '',
      state: json['state'] as String? ?? '',
      prov: json['prov'] as String? ?? '',
      longt: json['longt'] as String? ?? '',
      latt: json['latt'] as String? ?? '',
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'staddress': instance.street,
      'city': instance.city,
      'country': instance.country,
      'region': instance.region,
      'state': instance.state,
      'prov': instance.prov,
      'longt': instance.longt,
      'latt': instance.latt,
    };
