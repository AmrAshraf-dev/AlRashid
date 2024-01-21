import 'dart:convert';

import 'dart:io';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserDataModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isActive,
    this.phone,
    this.birthDate,
    this.gender,
    this.identityImage,
    this.createdAt,
    this.updatedAt,
    this.source,
    this.firebaseToken,
    this.deviceType,
    this.lang,
  });
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? isActive;
  dynamic phone;
  String? birthDate;
  String? gender;
  File? identityImage;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? source;
  String? firebaseToken;
  String? deviceType;
  String? lang;

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    isActive = json['is_active'];
    phone = json['phone'];
    birthDate = json['birthdate'];
    gender = json['gender'];
    image = json['identity_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    source = null;
    firebaseToken = json['firebase_token'];
    deviceType = json['device_type'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['is_active'] = isActive;
    _data['phone'] = phone;
    _data['birthdate'] = birthDate;
    _data['gender'] = gender;
    _data['identity_image'] = identityImage;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['source'] = source;
    _data['firebase_token'] = firebaseToken;
    _data['device_type'] = deviceType;
    _data['lang'] = lang;
    return _data;
  }
}
