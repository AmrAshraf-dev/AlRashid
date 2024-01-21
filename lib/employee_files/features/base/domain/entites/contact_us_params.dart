class ContactUsParams{
  String? name;
  String? email;
  String? phone;
  String? message;
  ContactUsParams({
    this.name,
    this.phone,
    this.email,
    this.message
});
  Map<String,dynamic>toJson()=>{
    "name":name,
    "phone":phone,
    "email":email,
    "messge":message,
  };


}