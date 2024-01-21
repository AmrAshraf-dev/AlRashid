import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.accessToken,
    this.tokenType,
    this.user,
    this.expiresIn,
  });
  String? accessToken;
  String? tokenType;
  User? user;
  num? expiresIn;

  AuthModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    user = User.fromJson(json['user']);
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    _data['user'] = user!.toJson();
    _data['expires_in'] = expiresIn;
    return _data;
  }
}

class User {
  User({
    this.firebaseToken,
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isActive,
    this.phone,
    this.source,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? isActive;
  dynamic phone;
  String? source;
  String? createdAt;
  String? updatedAt;
  String? firebaseToken;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    isActive = json['is_active'];
    phone = json['phone'];
    source = json['source'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firebaseToken = json['firebase_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['is_active'] = isActive;
    _data['phone'] = phone;
    _data['source'] = source;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['firebase_token'] = firebaseToken;

    return _data;
  }
}
