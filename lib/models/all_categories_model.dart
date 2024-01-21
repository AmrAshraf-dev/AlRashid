import 'dart:convert';

AllCategoriesModel allCategoriesModelFromJson(String str) =>
    AllCategoriesModel.fromJson(json.decode(str));
String allCategoriesModelToJson(AllCategoriesModel data) =>
    json.encode(data.toJson());

class AllCategoriesModel {
  AllCategoriesModel({
    this.categoriesModel,
  });
  List<Categories>? categoriesModel;

  AllCategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesModel = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categoriesModel?.map((e) => e.toJson()).toList();
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
    return _data;
  }
}

class CategoriesByIdModel {
  CategoriesByIdModel({
    this.category,
  });
  Category? category;

  CategoriesByIdModel.fromJson(Map<String, dynamic> json) {
    category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category?.toJson();
    return _data;
  }
}

CategoriesByIdModel categoriesByIdModelFromJson(String str) =>
    CategoriesByIdModel.fromJson(json.decode(str));
String categoriesByIdModelToJson(CategoriesByIdModel data) =>
    json.encode(data.toJson());

class Category {
  Category({
    this.id,
    this.nameAr,
    this.nameEn,
    this.active,
    this.image,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.name,
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

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    active = json['active'];
    image = json['image'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
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
    return _data;
  }
}
