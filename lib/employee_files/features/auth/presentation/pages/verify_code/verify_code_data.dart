part of'verify_code_imports.dart';

class VerifyCodeData{
  String? code;
  final GenericBloc<bool> codeCubit = GenericBloc(false);
   GlobalKey<CustomButtonState> btnKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  GenericBloc<String> timeCubit = GenericBloc("0");



  void onComplete(String value){
    codeCubit.onUpdateData(value.length==4);
    code = value;
  }

  void resendCode(BuildContext context,String email)async{
    var result = await SetForgetPassword().call(email);
    if(result!=null){
      CustomToast.showSimpleToast(msg: tr("sendCodeSuccess"),type: ToastType.success);
    }
  }

  void resetPasswordByCode(BuildContext context,String email)async{
    if(formKey.currentState!.validate()){
      btnKey.currentState!.animateForward();
      bool? result = await SetResetPasswordByCode().call(VerifyCodeParams(email:email,code: code??""));
      btnKey.currentState!.animateReverse();
      if(result==true){
        AutoRouter.of(context).push(ResetPasswordRoute(email: email, code: code??""));
      }
    }
  }

}