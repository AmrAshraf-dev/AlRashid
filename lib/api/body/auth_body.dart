import 'dart:io';

mixin AuthBody {
  static Map<String, dynamic> signInBodyMap(
      {String? phoneOrEmail, String? password, String? firebaseToken}) {
    // assert(phoneOrEmail != '' && password != '',
    //     'assertion field this field cannot be empty');

    Map<String, dynamic> body = {
      "email": phoneOrEmail!,
      "password": password!,
      "firebase_token": firebaseToken,
      "device_type": Platform.isAndroid ? "Android" : "Ios",
      //"type": phoneOrEmail.contains("@") ? "email" : "phone"
    };
    print("body ====>$body");
    return body;
  }

  static Map<String, dynamic> signUpBodyMap({
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
  }) =>
      {
        "name": name!,
        "email": email!,
        "phone": phoneNumber!,
        "password": password!,
      };

  static Map<String, dynamic> userDataBodyMap({
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
    String? birthDate,
    String? gender,
    //String? identityImage,
    File? identityImage,
  }) =>
      {
        "name": name!,
        "email": email!,
        "phone": phoneNumber!,
        "password": password!,
        "birthdate": birthDate,
        "gender": gender,
        "identity_image": identityImage,
      };

  static Map<String, dynamic> contactUsBodyMap({
    String? phoneNumber,
    String? email,
    String? name,
    String? yourMessage,
  }) =>
      {
        "name": name!,
        "email": email!,
        "phone": phoneNumber!,
        "messge": yourMessage!
      };

  static Map<String, dynamic> forgetPassAndResendVerfiyForRegBodyMap(
          {String? email}) =>
      {"email": email!};

  static Map<String, dynamic> codeCheckBodyMap({String? code, String? email}) =>
      {"email": email!, "code": code!};

  static Map<String, dynamic> resetPasswordBodyMap(
          {String? code, String? password, String? email}) =>
      {"email": email!, "code": code!, "password": password!};

  static Map<String, dynamic> resetPasswordConfirmBodyMap(
          {String? code,
          String? password,
          String? email,
          String? confirmpassBody}) =>
      {
        "email": email!,
        "code": code!,
        "password": password!,
        "password_confirmation": confirmpassBody!
      };

  static Map<String, dynamic> socialLoginBody(
          {String? name,
          String? mail,
          String? socialProvider,
          String? token}) =>
      {
        "name": name ?? '',
        "email": mail ?? '',
        "token": token ?? '',
        "source": socialProvider ?? '',
      };

  static Map<String, dynamic> purchaseValueBodyMap(
          {int? invoiceId, int? amount}) =>
      {"invoice_id": invoiceId ?? 0, "amount": amount ?? 0};

  static Map<String, dynamic> positionsBodyMap({
    dynamic xpoint,
    dynamic ypoint,
    dynamic floor,
    String? nameEn,
    String? code,
    String? type,
    dynamic rotateAngle,
  }) =>
      {
        "x_point": xpoint ?? '',
        "y_point": ypoint ?? '',
        "floor": floor ?? '',
        "name_en": nameEn ?? '',
        "code": code ?? '',
        "type": type ?? '',
        'rotate_angle': rotateAngle ?? 0,
      };

  static Object routesBodyMap({
    int? xpoint,
    int? ypoint,
    int? lineId,
  }) =>
      {
        "x_point": xpoint.toString(),
        "y_point": ypoint.toString(),
        "line_id": lineId.toString(),
      };

  static Object addLineBodyMap({
    int? isIntersection,
    String? name,
    int? floor,
  }) =>
      {
        "is_intersection": isIntersection.toString(),
        "name": name.toString(),
        "floor": floor.toString(),
      };
}
