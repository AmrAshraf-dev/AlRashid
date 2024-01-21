part of'forget_password_imports.dart';

class ForgetPasswordData{
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<CustomButtonState> btnKey = GlobalKey();
  TextEditingController email = TextEditingController();

  final GenericBloc<String> phoneCubit = GenericBloc("");

  void resetPassword(BuildContext context)async{
    if(formKey.currentState!.validate()){
      btnKey.currentState!.animateForward();
      var result = await SetForgetPassword().call(email.text);
      btnKey.currentState!.animateReverse();
      if(result!=null){
        AutoRouter.of(context).push(VerifyCodeRoute(email: email.text));
      }
    }
  }
}