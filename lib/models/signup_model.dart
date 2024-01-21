import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.accessToken,
    this.tokenType,
    this.userSignUp,
    this.expiresIn,
    this.messageEn,
    this.messgeAr,
  });
  String? accessToken;
  String? tokenType;
  UserSignUp? userSignUp;
  String? expiresIn;
  String? messageEn;
  String? messgeAr;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    userSignUp = UserSignUp.fromJson(json['user']);
    expiresIn = json['expires_in'];
    messageEn = json['message_en'];
    messgeAr = json['messge_ar'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    _data['user'] = userSignUp?.toJson();
    _data['expires_in'] = expiresIn;
    _data['message_en'] = messageEn;
    _data['messge_ar'] = messgeAr;
    return _data;
  }
}

class UserSignUp {
  UserSignUp({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isActive,
    this.phone,
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
  String? createdAt;
  String? updatedAt;
  String? source;
  String? firebaseToken;
  String? deviceType;
  String? lang;

  UserSignUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    isActive = json['is_active'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    source = null;
    firebaseToken = null;
    deviceType = null;
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
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['source'] = source;
    _data['firebase_token'] = firebaseToken;
    _data['device_type'] = deviceType;
    _data['lang'] = lang;
    return _data;
  }
}
