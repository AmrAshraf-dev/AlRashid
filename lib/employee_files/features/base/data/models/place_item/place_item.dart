import 'package:json_annotation/json_annotation.dart'; 

part 'place_item.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class PlaceItem {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'x_point')
  int? xPoint;
  @JsonKey(name: 'y_point')
  int? yPoint;
  @JsonKey(name: 'floor')
  int? floor;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'rotate_angle')
  int? rotateAngle;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'screen_width')
  int? screenWidth;
  @JsonKey(name: 'screen_height')
  int? screenHeight;

  PlaceItem({this.id, this.xPoint, this.yPoint, this.floor, this.image, this.name, this.code, this.rotateAngle, this.type, this.screenWidth, this.screenHeight});

   factory PlaceItem.fromJson(Map<String, dynamic> json) => _$PlaceItemFromJson(json);

   Map<String, dynamic> toJson() => _$PlaceItemToJson(this);
}

