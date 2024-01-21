class ResetPasswordParams{
   String email;
   String code;
   String password;

   ResetPasswordParams({required this.password,required this.email,required this.code});

   Map<String,dynamic> toJson()=>{
      "email":email,
      "code":code,
      "password":password,
      "password_confirmation":password,
   };
}