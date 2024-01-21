import 'dart:convert';

AllEventsModel allEventsModelFromJson(String str) =>
    AllEventsModel.fromJson(json.decode(str));
String allEventsModelToJson(AllEventsModel data) => json.encode(data.toJson());

class AllEventsModel {
  AllEventsModel({
    this.showAlleventsModel,
  });
  List<Events>? showAlleventsModel;

  AllEventsModel.fromJson(Map<String, dynamic> json) {
    showAlleventsModel =
        List.from(json['events']).map((e) => Events.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['events'] = showAlleventsModel!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Events {
  Events({
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

  Events.fromJson(Map<String, dynamic> json) {
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

EventsByIdModel eventsByIdModelFromJson(String str) =>
    EventsByIdModel.fromJson(json.decode(str));
String eventsByIdModelToJson(EventsByIdModel data) =>
    json.encode(data.toJson());

class EventsByIdModel {
  EventsByIdModel({
    this.eventsById,
  });
  EventsById? eventsById;

  EventsByIdModel.fromJson(Map<String, dynamic> json) {
    eventsById = EventsById.fromJson(json['event']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['event'] = eventsById!.toJson();
    return _data;
  }
}

class EventsById {
  EventsById({
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

  EventsById.fromJson(Map<String, dynamic> json) {
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
