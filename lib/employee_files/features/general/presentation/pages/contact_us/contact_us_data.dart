part of'contact_us_imports.dart';
class ContactUsData{
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController subject = TextEditingController();
  sendMessage(BuildContext context)async{
    if(formKey.currentState!.validate()){
      btnKey.currentState!.animateForward();
      ContactUsParams params = ContactUsParams(
          email: email.text,
          phone: phone.text,
          name: name.text,
          message: message.text,
      );
      var res = await SetContactUs().call(params);
      btnKey.currentState!.animateReverse();

      if(res ){
        email.clear();
        phone.clear();
        name.clear();
        message.clear();
        subject.clear();
        AutoRouter.of(context).pop();
        CustomToast.showSimpleToast(msg: tr("sendSuccess"),type: ToastType.success);
      }
    }


  }


}