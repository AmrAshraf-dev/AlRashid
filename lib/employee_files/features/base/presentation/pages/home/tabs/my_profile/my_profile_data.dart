part of 'my_profile_imports.dart';

class MyProfileData {
  void changeLanguage(String lang, BuildContext context) async {
    var language = await ChangeLanguage()(lang);
    if (language) {
      getIt<Utilities>().changeLanguage(lang, context);
      Phoenix.rebirth(context);
    }
  }
}
