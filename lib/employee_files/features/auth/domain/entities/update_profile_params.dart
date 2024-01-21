import 'dart:io';

class UpdateProfileParams{
  String? name;
  String? email;
  String? phone;
  //String? password;
  File? nationalId;
  String? startWork;
  String? endWork;
  int? placeId;


  UpdateProfileParams(
      {
         this.phone,
         this.email,
        // this.password,
         this.name,
         this.endWork,
        this.nationalId,
         this.placeId,
         this.startWork,
      });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
   // "password": password,
    "end_work": endWork,
    "national_id": nationalId,
    "place_id": placeId,
    "start_work": startWork,

  };
}