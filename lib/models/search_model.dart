import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.placesModel,
  });
  List<PlacesModel>? placesModel;

  SearchModel.fromJson(Map<String, dynamic> json) {
    placesModel =
        List.from(json['places']).map((e) => PlacesModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['places'] = placesModel!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PlacesModel {
  PlacesModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.workTimeFrom,
    this.workTimeTo,
    this.descriptionAr,
    this.descriptionEn,
    this.floorNumber,
    this.image,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
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
  int? serviceId;
  String? createdAt;
  String? updatedAt;

  PlacesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    workTimeFrom = json['work_time_from'];
    workTimeTo = json['work_time_to'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    floorNumber = json['floor_number'];
    image = json['image'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    _data['service_id'] = serviceId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
