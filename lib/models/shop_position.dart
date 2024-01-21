import 'dart:convert';

List<ShopPositionModel> shopPositionModelFromJson(String str) {
  var response = json.decode(str)['data'];
  return response
      .map<ShopPositionModel>((e) => ShopPositionModel.fromJson(e))
      .toList();
}

String shopPositionModelToJson(ShopPositionModel data) =>
    json.encode(data.toJson());

class ShopPositionModel {
  int? id;
  int? x;
  int? y;
  String? name;
  String? code;
  int? floor;
  String? type;
  int? screenWidth;
  int? screenHeight;
  dynamic rotateAngle;
  String? image;

  ShopPositionModel({
    this.id,
    this.x,
    this.y,
    this.name,
    this.code,
    this.floor,
    this.type,
    this.screenWidth,
    this.screenHeight,
    this.rotateAngle,
    this.image,
  });

  factory ShopPositionModel.fromJson(Map<String, dynamic> json) =>
      ShopPositionModel(
        id: json['id'],
        x: json['x_point'],
        y: json['y_point'],
        name: json['name'],
        code: json['code'],
        floor: json['floor'],
        type: json['type'],
        screenWidth: json['screen_width'],
        screenHeight: json['screen_height'],
        rotateAngle: json['rotate_angle'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        "x_point": x,
        "y_point": y,
        "name": name,
        "code": code,
        "floor": floor,
        'type': type,
        "screen_width": screenWidth,
        "screen_height": screenHeight,
        'rotate_angle': rotateAngle,
        'image': image,
      };
}
