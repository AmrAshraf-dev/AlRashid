part of 'reset_password_imports.dart';

class ResetPasswordData {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<CustomButtonState> btnKey = GlobalKey();

  void resetPasswordByCode(BuildContext context, String email , String code) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      ResetPasswordParams params = ResetPasswordParams(password: password.text, code: code, email: email);
      var result = await SetResetPassword().call(params);
      btnKey.currentState!.animateReverse();
      if (result != null) {
        confirmPassword.clear();
        password.clear();
        AutoRouter.of(context).pushAndPopUntil(const SelectUserRoute(), predicate: (o) => false);
        CustomToast.showSnakeBar(tr("passChangSucc"));
      }
    }
  }
}
