import 'dart:convert';

MySinglePlaceModel mySinglePlaceModelFromJson(String str) =>
    MySinglePlaceModel.fromJson(json.decode(str));
String mySinglePlaceModelToJson(MySinglePlaceModel data) =>
    json.encode(data.toJson());

class MySinglePlaceModel {
  MySinglePlaceModel({
    this.singlePlaceModel,
  });
  SinglePlaceModel? singlePlaceModel;

  MySinglePlaceModel.fromJson(Map<String, dynamic> json) {
    singlePlaceModel = SinglePlaceModel.fromJson(json['place']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['place'] = singlePlaceModel!.toJson();
    return _data;
  }
}

class SinglePlaceModel {
  SinglePlaceModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.workTimeFrom,
    this.workTimeTo,
    this.descriptionAr,
    this.descriptionEn,
    this.floorNumber,
    this.image,
    // this.serviceId,
    this.createdAt,
    this.updatedAt,
    // this.service,
  });
  int? id;
  String? nameAr;
  String? nameEn;
  String? workTimeFrom;
  String? workTimeTo;
  String? descriptionAr;
  String? descriptionEn;
  String? floorNumber;
  String? image;
  //int? serviceId;
  String? createdAt;
  String? updatedAt;
  String? serial;
  dynamic categoryId;
  // SingleServiceModel? service;

  SinglePlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    workTimeFrom = json['work_time_from'];
    workTimeTo = json['work_time_to'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    floorNumber = json['floor_number'];
    image = json['image'];
    // serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serial = json['serial'];
    categoryId = json['category_id'];
    // service = SingleServiceModel.fromJson(json['service']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['work_time_from'] = workTimeFrom;
    _data['work_time_to'] = workTimeTo;
    _data['description_ar'] = descriptionAr;
    _data['description_en'] = descriptionEn;
    _data['floor_number'] = floorNumber;
    _data['image'] = image;
    // _data['service_id'] = serviceId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['serial'] = serial;
    _data['category_id'] = categoryId;
    //_data['service'] = service!.toJson();
    return _data;
  }
}

class SingleServiceModel {
  SingleServiceModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
  });
  int? id;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;

  SingleServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['description_ar'] = descriptionAr;
    _data['description_en'] = descriptionEn;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['name'] = name;
    _data['description'] = description;
    return _data;
  }
}
