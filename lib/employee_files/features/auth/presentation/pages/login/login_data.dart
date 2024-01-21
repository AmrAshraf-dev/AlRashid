part of 'login_imports.dart';

class LoginData {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController student = TextEditingController();
  final GenericBloc<bool> passwordCubit = GenericBloc(false);

  void setUserLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    String? token = await FirebaseMessaging.instance.getToken();
    var userType = context.read<UserCubit>().state.model?.user?.manger;
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      LoginParams params = LoginParams(
        password: password.text,
        email: email.text,
        deviceType: Platform.isAndroid ? "android" : "ios",
        firebaseToken: token,
        user_type: userType,
      );
      var user = await SetUserLogin()(params);
      btnKey.currentState!.animateReverse();
      if (user != null) {
        context.read<AuthCubit>().onUpdateAuth(true);
        GlobalState.instance.set("token", user.token?.token);
        context.read<UserCubit>().onUpdateUserData(user);
        getIt<Utilities>().saveUserData(user);
        CustomToast.showSimpleToast(
            msg: tr("loginSuccess"), type: ToastType.success);
        AutoRouter.of(context).push(const HomeRoute());
      }
    }
  }
}
