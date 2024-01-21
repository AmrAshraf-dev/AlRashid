class VerifyCodeParams{

  String email;
  String code;

  VerifyCodeParams({required this.email,required this.code});

  Map<String,dynamic> toJson()=>{
    "email":email,
    "code":code
  };
}