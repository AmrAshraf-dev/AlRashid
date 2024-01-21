import 'dart:convert';

// List<LinesModel> linesModelFromJson(String str) {
//   var response = json.decode(str)['data'];
//   return response.map<LinesModel>((e) => LinesModel.fromJson(e)).toList();
// }

// class LinesModel {
//   LinesModel({
//     this.data,
//   });
//   List<Data>? data;

//   LinesModel.fromJson(Map<String, dynamic> json) {
//     data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['data'] = data?.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     this.id,
//     this.name,
//     this.isIntersection,
//     this.createdAt,
//     this.updatedAt,
//   });
//   dynamic id;
//   String? name;
//   bool? isIntersection;
//   String? createdAt;
//   String? updatedAt;

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     isIntersection = json['is_intersection'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['is_intersection'] = isIntersection;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

List<LinesModel> linesModelFromJson(String str) {
  var response = json.decode(str)['data'];
  return response.map<LinesModel>((e) => LinesModel.fromJson(e)).toList();
}

String linesModelToJson(LinesModel data) => json.encode(data.toJson());

class LinesModel {
  dynamic id;
  String? name;
  bool? isIntersection;
  String? createdAt;
  String? updatedAt;

  LinesModel({
    this.id,
    this.name,
    this.isIntersection,
    this.createdAt,
    this.updatedAt,
  });

  factory LinesModel.fromJson(Map<String, dynamic> json) => LinesModel(
        id: json['id'],
        name: json['name'],
        isIntersection: json['is_intersection'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_intersection": isIntersection,
      };
}
