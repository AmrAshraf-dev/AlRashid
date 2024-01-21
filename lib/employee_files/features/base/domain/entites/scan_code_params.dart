class ScanCodeParams{
  int? user;
  String? code;

  ScanCodeParams({this.user,this.code});
  Map<String,dynamic>toJson()=>{
    "user":user,
    "code":code,

  };
}