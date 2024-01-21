class SettingModel {
  int? id;
  String? facebook;
  String? instagram;
  String? whatsapp;
  String? androidStoreLink;
  String? iosStoreLink;
  String? about;
  String? terms;
  String? privacy;
  String? about_en;
  String? terms_en;
  String? privacy_en;
  String? createdAt;
  String? updatedAt;

  SettingModel(
      {this.id,
        this.facebook,
        this.instagram,
        this.androidStoreLink,
        this.iosStoreLink,
        this.about,
        this.terms,
        this.privacy,
        this.createdAt,
        this.whatsapp,
        this.updatedAt,this.about_en,this.privacy_en,this.terms_en});

  SettingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    facebook = json['facebook'];
    whatsapp = json['whatsapp'];
    instagram = json['instagram'];
    androidStoreLink = json['android_store_link'];
    iosStoreLink = json['ios_store_link'];
    about = json['about'];
    terms = json['terms'];
    privacy = json['privacy'];
    about_en = json['about_en'];
    terms_en = json['terms_en'];
    privacy_en = json['privacy_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['facebook'] = facebook;
    data['whatsapp'] = whatsapp;
    data['instagram'] = instagram;
    data['android_store_link'] = androidStoreLink;
    data['ios_store_link'] = iosStoreLink;
    data['about'] = about;
    data['terms'] = terms;
    data['privacy'] = privacy;
    data['about_en'] = about_en;
    data['terms_en'] = terms_en;
    data['privacy_en'] = privacy_en;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}