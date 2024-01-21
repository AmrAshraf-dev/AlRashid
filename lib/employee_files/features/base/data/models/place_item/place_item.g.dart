// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceItem _$PlaceItemFromJson(Map<String, dynamic> json) => PlaceItem(
      id: json['id'] as int?,
      xPoint: json['x_point'] as int?,
      yPoint: json['y_point'] as int?,
      floor: json['floor'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      rotateAngle: json['rotate_angle'] as int?,
      type: json['type'] as String?,
      screenWidth: json['screen_width'] as int?,
      screenHeight: json['screen_height'] as int?,
    );

Map<String, dynamic> _$PlaceItemToJson(PlaceItem instance) => <String, dynamic>{
      'id': instance.id,
      'x_point': instance.xPoint,
      'y_point': instance.yPoint,
      'floor': instance.floor,
      'image': instance.image,
      'name': instance.name,
      'code': instance.code,
      'rotate_angle': instance.rotateAngle,
      'type': instance.type,
      'screen_width': instance.screenWidth,
      'screen_height': instance.screenHeight,
    };
