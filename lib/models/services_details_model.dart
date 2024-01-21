import 'dart:convert';

ServicesDetailsModel servicesDetailsModelFromJson(String str) =>
    ServicesDetailsModel.fromJson(json.decode(str));
String servicesDetailsModelToJson(ServicesDetailsModel data) =>
    json.encode(data.toJson());

class ServicesDetailsModel {
  ServicesDetailsModel({
    this.service,
  });
  ServiceModelSecond? service;

  ServicesDetailsModel.fromJson(Map<String, dynamic> json) {
    service = ServiceModelSecond.fromJson(json['service']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['service'] = service!.toJson();
    return _data;
  }
}

class ServiceModelSecond {
  ServiceModelSecond({
    this.id,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.service,
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
  String? service;
  String? name;
  String? description;

  ServiceModelSecond.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    service = json['service'];
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
    _data['service'] = service;
    _data['name'] = name;
    _data['description'] = description;
    return _data;
  }
}
