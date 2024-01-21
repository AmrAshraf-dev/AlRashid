// To parse this JSON data, do
//
//     final errMessageModel = errMessageModelFromJson(jsonString);

import 'dart:convert';

ErrMessageModel errMessageModelFromJson(String str) =>
    ErrMessageModel.fromJson(json.decode(str));

String errMessageModelToJson(ErrMessageModel data) => json.encode(data.toJson());

class ErrMessageModel {
  ErrMessageModel({
    this.messageEn,
    this.messageAr,
  });

  String? messageEn;
  String? messageAr;

  factory ErrMessageModel.fromJson(Map<String, dynamic> json) => ErrMessageModel(
        messageEn: json["message_en"],
        messageAr: json["message_ar"],
      );

  Map<String, dynamic> toJson() => {
        "message_en": messageEn,
        "message_ar": messageAr,
      };
}
