
class ScanModel {
  Invoice? invoice;
  User? user;

  ScanModel({this.invoice, this.user});

  ScanModel.fromJson(Map<String, dynamic> json) {
    invoice =
    json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (invoice != null) {
      data['invoice'] = invoice?.toJson();
    }
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}

class Invoice {
  int? id;
  String? code;
  int? codePrice;
  int? amountBeforeDiscount;
  int? userId;
  int? employerId;
  int? placeId;
  String? invoice;
  String? createdAt;
  String? updatedAt;
  int? total;
  Employer? employer;
  Place? place;

  Invoice(
      {this.id,
        this.code,
        this.codePrice,
        this.amountBeforeDiscount,
        this.userId,
        this.employerId,
        this.placeId,
        this.invoice,
        this.createdAt,
        this.updatedAt,
        this.total,
        this.employer,
        this.place});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    codePrice = json['code_price'];
    amountBeforeDiscount = json['amount_before_discount'];
    userId = json['user_id'];
    employerId = json['employer_id'];
    placeId = json['place_id'];
    invoice = json['invoice'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    total = json['total'];
    employer = json['employer'] != null
        ? Employer.fromJson(json['employer'])
        : null;
    place = json['place'] != null ? Place.fromJson(json['place']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['code_price'] = codePrice;
    data['amount_before_discount'] = amountBeforeDiscount;
    data['user_id'] = userId;
    data['employer_id'] = employerId;
    data['place_id'] = placeId;
    data['invoice'] = invoice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total'] = total;
    if (employer != null) {
      data['employer'] = employer?.toJson();
    }
    if (place != null) {
      data['place'] = place?.toJson();
    }
    return data;
  }
}

class Employer {
  int? id;
  String? name;
  String? email;
  String? phone;

  Employer({this.id, this.name, this.email, this.phone});

  Employer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

class Place {
  int? id;
  String? nameAr;
  String? nameEn;
  String? workTimeFrom;
  String? workTimeTo;
  String? descriptionAr;
  String? descriptionEn;
  String? floorNumber;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? serial;
  int? categoryId;

  Place(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.workTimeFrom,
        this.workTimeTo,
        this.descriptionAr,
        this.descriptionEn,
        this.floorNumber,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.serial,
        this.categoryId});

  Place.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    workTimeFrom = json['work_time_from'];
    workTimeTo = json['work_time_to'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    floorNumber = json['floor_number'];
    image = json['image'];
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['serial'] = serial;
    data['category_id'] = categoryId;
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
  dynamic source;
  dynamic lang;
  dynamic birthdate;
  dynamic identityImage;
  dynamic nationalId;
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
        this.nationalId,
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
    nationalId = json['national_id'];
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
    data['national_id'] = nationalId;
    data['gender'] = gender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
