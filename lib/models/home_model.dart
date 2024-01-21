import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));
String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.sliders,
    this.eventsModel,
    this.servicesModel,
    this.categories,
  });
  List<Sliders>? sliders;
  List<EventsModel>? eventsModel;
  List<ServicesModel>? servicesModel;
  List<Categories>? categories;

  HomeModel.fromJson(Map<String, dynamic> json) {
    sliders =
        List.from(json['sliders']).map((e) => Sliders.fromJson(e)).toList();
    eventsModel =
        List.from(json['events']).map((e) => EventsModel.fromJson(e)).toList();
    servicesModel = List.from(json['services'])
        .map((e) => ServicesModel.fromJson(e))
        .toList();
    categories = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sliders'] = sliders?.map((e) => e.toJson()).toList();
    _data['events'] = eventsModel?.map((e) => e.toJson()).toList();
    _data['services'] = servicesModel?.map((e) => e.toJson()).toList();
    _data['categories'] = categories?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Sliders {
  Sliders({
    this.id,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
  });
  int? id;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
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
    _data['title_ar'] = titleAr;
    _data['title_en'] = titleEn;
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

class EventsModel {
  EventsModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.startAt,
    this.endAt,
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
  String? startAt;
  String? endAt;
  String? descriptionAr;
  String? descriptionEn;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;

  EventsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    startAt = json['start_at'];
    endAt = json['end_at'];
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
    _data['start_at'] = startAt;
    _data['end_at'] = endAt;
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

class ServicesModel {
  ServicesModel({
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

  ServicesModel.fromJson(Map<String, dynamic> json) {
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

class Categories {
  Categories({
    this.id,
    this.nameAr,
    this.nameEn,
    this.active,
    this.image,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.childes,
  });
  int? id;
  String? nameAr;
  String? nameEn;
  String? active;
  String? image;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<Childes>? childes;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    active = json['active'];
    image = json['image'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    childes =
        List.from(json['childes']).map((e) => Childes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['active'] = active;
    _data['image'] = image;
    _data['parent_id'] = parentId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['name'] = name;
    _data['childes'] = childes?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Childes {
  Childes({
    this.id,
    this.nameAr,
    this.nameEn,
    this.active,
    this.image,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.storesPlacesModel,
  });
  int? id;
  String? nameAr;
  String? nameEn;
  String? active;
  String? image;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<StoresPlacesModel>? storesPlacesModel;

  Childes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    active = json['active'];
    image = json['image'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    storesPlacesModel = List.from(json['places'])
        .map((e) => StoresPlacesModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    _data['active'] = active;
    _data['image'] = image;
    _data['parent_id'] = parentId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['name'] = name;
    _data['places'] = storesPlacesModel?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class StoresPlacesModel {
  StoresPlacesModel({
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
  String? serial;
  dynamic categoryId;

  StoresPlacesModel.fromJson(Map<String, dynamic> json) {
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
