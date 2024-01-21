import 'dart:convert';

StoresModel storesModelFromJson(String str) =>
    StoresModel.fromJson(json.decode(str));
String storesModelToJson(StoresModel data) => json.encode(data.toJson());

class StoresModel {
  StoresModel({
    this.storesPlacesModel,
  });
  List<StoresPlacesModel>? storesPlacesModel;

  StoresModel.fromJson(Map<String, dynamic> json) {
    storesPlacesModel = List.from(json['data'])
        .map((e) => StoresPlacesModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = storesPlacesModel?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class StoresPlacesModel {
  StoresPlacesModel({
    this.id,
    this.xPoint,
    this.yPoint,
    this.floor,
    this.image,
    this.name,
    this.code,
    this.rotateAngle,
    this.type,
    this.screenWidth,
    this.screenHeight,
  });
  int? id;
  int? xPoint;
  int? yPoint;
  int? floor;
  String? image;
  String? name;
  String? code;
  int? rotateAngle;
  String? type;
  int? screenWidth;
  int? screenHeight;

  StoresPlacesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    xPoint = json['x_point'];
    yPoint = json['y_point'];
    floor = json['floor'];
    image = json['image'];
    name = json['name'];
    code = json['code'];
    rotateAngle = json['rotate_angle'];
    type = json['type'];
    screenWidth = json['screen_width'];
    screenHeight = json['screen_height'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['x_point'] = xPoint;
    _data['y_point'] = yPoint;
    _data['floor'] = floor;
    _data['image'] = image;
    _data['name'] = name;
    _data['code'] = code;
    _data['rotate_angle'] = rotateAngle;
    _data['type'] = type;
    _data['screen_width'] = screenWidth;
    _data['screen_height'] = screenHeight;
    return _data;
  }
}
////////////////////////////////////////////
///single place Model///
////////////////////////////////////////////

// MySinglePlaceModel mySinglePlaceModelFromJson(String str) =>
//     MySinglePlaceModel.fromJson(json.decode(str));
// String mySinglePlaceModelToJson(MySinglePlaceModel data) =>
//     json.encode(data.toJson());

// class MySinglePlaceModel {
//   MySinglePlaceModel({
//     this.singlePlaceModel,
//   });
//   SinglePlaceModel? singlePlaceModel;

//   MySinglePlaceModel.fromJson(Map<String, dynamic> json) {
//     singlePlaceModel = SinglePlaceModel.fromJson(json['place']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['place'] = singlePlaceModel!.toJson();
//     return _data;
//   }
// }

// class SinglePlaceModel {
//   SinglePlaceModel({
//     this.id,
//     this.nameAr,
//     this.nameEn,
//     this.workTimeFrom,
//     this.workTimeTo,
//     this.descriptionAr,
//     this.descriptionEn,
//     this.floorNumber,
//     this.image,
//     this.serviceId,
//     this.createdAt,
//     this.updatedAt,
//     this.service,
//   });
//   int? id;
//   String? nameAr;
//   String? nameEn;
//   String? workTimeFrom;
//   String? workTimeTo;
//   String? descriptionAr;
//   String? descriptionEn;
//   String? floorNumber;
//   String? image;
//   int? serviceId;
//   String? createdAt;
//   String? updatedAt;
//   SingleServiceModel? service;

//   SinglePlaceModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameAr = json['name_ar'];
//     nameEn = json['name_en'];
//     workTimeFrom = json['work_time_from'];
//     workTimeTo = json['work_time_to'];
//     descriptionAr = json['description_ar'];
//     descriptionEn = json['description_en'];
//     floorNumber = json['floor_number'];
//     image = json['image'];
//     serviceId = json['service_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     service = SingleServiceModel.fromJson(json['service']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name_ar'] = nameAr;
//     _data['name_en'] = nameEn;
//     _data['work_time_from'] = workTimeFrom;
//     _data['work_time_to'] = workTimeTo;
//     _data['description_ar'] = descriptionAr;
//     _data['description_en'] = descriptionEn;
//     _data['floor_number'] = floorNumber;
//     _data['image'] = image;
//     _data['service_id'] = serviceId;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['service'] = service!.toJson();
//     return _data;
//   }
// }

// class SingleServiceModel {
//   SingleServiceModel({
//     this.id,
//     this.nameAr,
//     this.nameEn,
//     this.descriptionAr,
//     this.descriptionEn,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.name,
//     this.description,
//   });
//   int? id;
//   String? nameAr;
//   String? nameEn;
//   String? descriptionAr;
//   String? descriptionEn;
//   String? image;
//   String? createdAt;
//   String? updatedAt;
//   String? name;
//   String? description;

//   SingleServiceModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameAr = json['name_ar'];
//     nameEn = json['name_en'];
//     descriptionAr = json['description_ar'];
//     descriptionEn = json['description_en'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     name = json['name'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name_ar'] = nameAr;
//     _data['name_en'] = nameEn;
//     _data['description_ar'] = descriptionAr;
//     _data['description_en'] = descriptionEn;
//     _data['image'] = image;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['name'] = name;
//     _data['description'] = description;
//     return _data;
//   }
// }
