import 'dart:io';

class RegisterParams {
  String name;
  String email;
  String phone;
  String password;
  String accountType;
  File nationalId;
  String startWork;
  String endWork;
  int placeId;


  RegisterParams(
      {
        required this.phone,
        required this.email,
        required this.password,
        required this.name,
        required this.accountType,
        required this.endWork,
        required this.nationalId,
        required this.placeId,
        required this.startWork,
      });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "account_type": accountType,
    "end_work": endWork,
    "national_id": nationalId,
    "place_id": placeId,
    "start_work": startWork,

  };
}
