class PlaceModel {
  Place? place;
  String? startWork;
  String? endWork;

  PlaceModel({this.place, this.startWork, this.endWork});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    place = json['place'] != null ? Place.fromJson(json['place']) : null;
    startWork = json['start_work'];
    endWork = json['end_work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (place != null) {
      data['place'] = place!.toJson();
    }
    data['start_work'] = startWork;
    data['end_work'] = endWork;
    return data;
  }
}

class Place {
  int? id;
  String? name_ar;
  String? name_en;
  String? work_time_from;
  String? work_time_to;
  String? description_ar;
  String? description_en;
  String? image;
  num? service_id;
  num? screen_width;
  num? screen_height;
  num? x_point;
  num? y_point;
  int? floor;
  String? code;
  String? type;
  String? serial;
  int? category_id;
  int? is_vertical;
  num? rotateAngle;

  Place(
      {this.id,
      this.x_point,
      this.y_point,
      this.floor,
      this.image,
      this.name_ar,
      this.name_en,
      this.code,
      this.rotateAngle,
      this.type,
      this.screen_height,
      this.screen_width,
      this.category_id,
      this.description_ar,
      this.description_en,
      this.is_vertical,
      this.serial,
      this.service_id,
      this.work_time_from,
      this.work_time_to});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    x_point = json['x_point'];
    y_point = json['y_point'];
    floor = json['floor'];
    image = json['image'];
    name_en = json['name_en'];
    name_ar = json['name_ar'];
    code = json['code'];
    rotateAngle = json['rotate_angle'];
    type = json['type'];
    screen_width = json['screen_width'];
    screen_height = json['screen_height'];
    work_time_to = json['work_time_to'];
    work_time_from = json['work_time_from'];
    service_id = json['service_id'];
    serial = json['serial'];
    is_vertical = json['is_vertical'];
    description_en = json['description_en'];
    description_ar = json['description_ar'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['x_point'] = x_point;
    data['y_point'] = y_point;
    data['floor'] = floor;
    data['image'] = image;
    data['name_ar'] = name_ar;
    data['name_en'] = name_en;
    data['code'] = code;
    data['rotate_angle'] = rotateAngle;
    data['type'] = type;
    data['screen_width'] = screen_width;
    data['screen_height'] = screen_height;
    data['description_en'] = description_en;
    data['description_ar'] = description_ar;
    data['serial'] = serial;
    data['service_id'] = service_id;
    return data;
  }
}

class Service {
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

  Service(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.descriptionAr,
      this.descriptionEn,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.description});

  Service.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['description_ar'] = descriptionAr;
    data['description_en'] = descriptionEn;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
