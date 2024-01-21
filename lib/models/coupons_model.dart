import 'dart:convert';

CouponsModel couponsModelFromJson(String str) =>
    CouponsModel.fromJson(json.decode(str));
String couponsModelToJson(CouponsModel data) => json.encode(data.toJson());

class CouponsModel {
  List<Codes>? codes;
  User? user;

  CouponsModel({this.codes, this.user});

  CouponsModel.fromJson(Map<String, dynamic> json) {
    if (json['codes'] != null) {
      codes = <Codes>[];
      json['codes'].forEach((v) {
        codes!.add(Codes.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (codes != null) {
      data['codes'] = codes!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Codes {
  String? endAt;
  String? code;
  int? id;
  String? users;
  List<Places>? places;
  String? discount;
  bool? expire;
  bool? usedbefore;
 Places? usedplace;

  Codes(
      {this.endAt,
        this.code,
        this.id,
        this.users,
        this.places,
        this.discount,
        this.expire,
        this.usedbefore,
        this.usedplace
        });

  Codes.fromJson(Map<String, dynamic> json) {
    endAt = json['end_at'];
    code = json['code'];
    id = json['id'];
    users = json['users'];
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(Places.fromJson(v));
      });
    }
    discount = json['discount'];
    expire = json['expire'];
    usedbefore = json['usedbefore'];
    usedplace = Places.fromJson(json['usedplace']??{});

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['end_at'] = endAt;
    data['code'] = code;
    data['id'] = id;
    data['users'] = users;
    if (places != null) {
      data['places'] = places?.map((v) => v.toJson()).toList();
    }
    data['discount'] = discount;
    data['expire'] = expire;
    data['usedbefore'] = usedbefore;
    data['usedplace'] = usedplace?.toJson();

    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? isActive;
  int? phone;
  String? source;
  String? lang;
  String? birthdate;
  String? identityImage;
  String? gender;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.isActive,
        this.phone,
        this.source,
        this.lang,
        this.birthdate,
        this.identityImage,
        this.gender,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isActive = json['is_active'];
    phone = json['phone'];
    source = json['source'];
    lang = json['lang'];
    birthdate = json['birthdate'];
    identityImage = json['identity_image'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_active'] = isActive;
    data['phone'] = phone;
    data['source'] = source;
    data['lang'] = lang;
    data['birthdate'] = birthdate;
    data['identity_image'] = identityImage;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Places {
  Places({
    this.id,
    this.nameAr,
    this.nameEn,
  });
  int? id;
  String? nameAr;
  String? nameEn;

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name_ar'] = nameAr;
    _data['name_en'] = nameEn;
    return _data;
  }

}

class CopunPlaceModel {
  int? id;
  String? nameAr;
  String? nameEn;
  String? workTimeFrom;
  String? workTimeTo;
  String? descriptionAr;
  String? descriptionEn;
  String? floorNumber;
  String? image;
  dynamic serviceId;
  String? createdAt;
  String? updatedAt;
  String? serial;
  int? categoryId;

  CopunPlaceModel(
      {this.id,
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
        this.serial,
        this.categoryId});

  CopunPlaceModel.fromJson(Map<String, dynamic> json) {
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
    serial = json['serial'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['work_time_from'] = workTimeFrom;
    data['work_time_to'] = workTimeTo;
    data['description_ar'] = descriptionAr;
    data['description_en'] = descriptionEn;
    data['floor_number'] = floorNumber;
    data['image'] = image;
    data['service_id'] = serviceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['serial'] = serial;
    data['category_id'] = categoryId;
    return data;
  }
}

