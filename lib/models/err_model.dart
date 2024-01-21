

import 'dart:convert';

ErrModel errModelFromJson(String str) => ErrModel.fromJson(json.decode(str));

String errModelToJson(ErrModel data) => json.encode(data.toJson());

class ErrModel {
    ErrModel({
        this.messageAr,
        this.messageEn,
    });

    String? messageAr;
    String? messageEn;

    factory ErrModel.fromJson(Map<String, dynamic> json) => ErrModel(
        messageAr: json["message_ar"],
        messageEn: json["message_en"],
    );

    Map<String, dynamic> toJson() => {
        "message_ar": messageAr,
        "message_en": messageEn,
    };
}
