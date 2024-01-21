class LoginParams {
  String? email;
  String? password;
  String? firebaseToken;
  String? deviceType;
  String? user_type;

  LoginParams(
      {this.password,
      this.email,
      this.firebaseToken,
      this.deviceType,
      this.user_type});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "firebase_token": firebaseToken,
        "device_type": deviceType,
    "user_type":user_type
      };
}
