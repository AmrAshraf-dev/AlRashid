import '../../../../auth/data_source/models/place/place_model.dart';

class EmployeeModel {
  int? id;

  String? name;
  String? email;
  String? phone;
  String? nationalId;
  String? identity_image;
  String? startWork;
  String? endWork;
  int? placeId;
  String? active;
  String? manger;
  String? createdAt;
  String? updatedAt;
  bool isExpanded;
  PlaceModel? place;

  EmployeeModel(
      {this.id,

        this.name,
        this.email,
        this.phone,
        this.nationalId,
        this.identity_image,
        this.startWork,
        this.endWork,
        this.placeId,
        this.active,
        this.manger,
        this.createdAt,
        this.updatedAt,
        this.isExpanded=false,
        this.place});

  EmployeeModel.fromJson(Map<String, dynamic> json, {this.isExpanded = false}) {
    id = json['id'];

    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    nationalId = json['national_id'];
    identity_image = json['identity_image'];
    startWork = json['start_work'];
    endWork = json['end_work'];
    placeId = json['place_id'];
    active = json['active'];
    manger = json['manger'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    place = json['place'] != null ? PlaceModel.fromJson(json['place']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['national_id'] = nationalId;
    data['identity_image'] = identity_image;
    data['start_work'] = startWork;
    data['end_work'] = endWork;
    data['place_id'] = placeId;
    data['active'] = active;
    data['manger'] = manger;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (place != null) {
      data['place'] = place!.toJson();
    }
    return data;
  }
}


