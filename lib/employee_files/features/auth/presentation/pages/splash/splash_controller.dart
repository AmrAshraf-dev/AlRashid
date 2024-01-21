part of 'splash_imports.dart';

class SplashController {
  void manipulateSaveData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var strUser = prefs.get("user");
    var result = await GetSettings().call(true);
    context.read<SettingCubit>().onUpdateSettingData(result ?? SettingModel());
    updateLang(context);
    print('stttttttttttttttt: $strUser');
    if (strUser != null) {
      context.read<AuthCubit>().onUpdateAuth(true);
      UserModel user = UserModel.fromJson(json.decode("$strUser"));
      GlobalState.instance.set("token", user.token?.token);
      context.read<UserCubit>().onUpdateUserData(user);
      await Future.delayed(const Duration(seconds: 2), () {});
      AutoRouter.of(context).push(const HomeRoute());
      print('iffffffffffff11111111111111');
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      context.read<AuthCubit>().onUpdateAuth(false);
      Future.delayed(const Duration(seconds: 2), () {
        AutoRouter.of(context).push(const WelcomePageRoute());
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => WelcomePage()));
      });
      print('22222222222222222222222222222222222222');
    }
  }

  Future<void> updateLang(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    String? value = pref.getString("lang");
    InitCustomPackages.instance.initCustomWidgets(language: value ?? "ar");
    context
        .read<LangCubit>()
        .onUpdateLanguage(Locale(value ?? "ar", value == "ar" ? 'EG' : 'US'));
  }
}
