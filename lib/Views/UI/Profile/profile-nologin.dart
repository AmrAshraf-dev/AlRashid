import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/Views/UI/Profile/contact_us.dart';
import 'package:alrashid_mall_app/Views/UI/Profile/current_coupons.dart';
import 'package:alrashid_mall_app/Views/UI/Profile/edit_my_data.dart';
import 'package:alrashid_mall_app/Views/UI/Profile/privacy_policy.dart';
import 'package:alrashid_mall_app/Views/UI/Profile/about_us.dart';
import 'package:alrashid_mall_app/Views/UI/chatbot/chatbot.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/auth_model.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:alrashid_mall_app/utils/show_sheet_func.dart';
import 'package:alrashid_mall_app/widgets/language_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:share_plus/share_plus.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileNoLogin extends StatefulWidget {
  const ProfileNoLogin({Key? key}) : super(key: key);

  @override
  State<ProfileNoLogin> createState() => _ProfileNoLoginState();
}

class _ProfileNoLoginState extends State<ProfileNoLogin> {
  @override
  Widget build(BuildContext context) {
    AuthModel authModel = AuthModel();
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Directionality(
        textDirection: lang == 'en' //locale!.locale.languageCode == 'ar'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(tr('myAccount'),
                    style: const TextStyle(
                      fontFamily: 'DINNextLTArabic',
                      fontSize: 20,
                    )),
              ),
            ),

            GlobalState.instance.get('token') != null
                // authModel.accessToken == '0' && authModel.user?.id == 0
                // token != '0'

                ? const Offstage()
                : Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CustomerLogin()));
                      },
                      child: Container(
                        width: 350,
                        height: 45,
                        child: Center(
                          child: Text(
                            tr('SignIn'),
                            style: const TextStyle(
                              color: Color(0xffb83f48),
                              fontFamily: ('DINNextLTArabic'),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffb83f48),
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                  ),

            GlobalState.instance.get('token') == null
                ? const Offstage()
                :
                //تعديل بياناتي
                GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EditMyData())),
                    child: ListTile(
                      leading: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.red[700],
                      ),
                      title: Text(
                        tr('Edit data'),
                        style: const TextStyle(
                          fontFamily: 'DINNextLTArabic',
                          fontSize: 17,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 5.0,
            ),

            ///من نحن

            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const AboutUs())),
              child: ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.red[700],
                ),
                title: Text(
                  tr('aboutUs'),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontSize: 17,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),

            ///كوبونات الشراء
            ///CurrentCoupons
            GlobalState.instance.get('token') == null
                ? const Offstage()
                : GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => CurrentCoupons())),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/icons/coupon.png',
                        color: Colors.red[700],
                        width: 20.0,
                        height: 20.0,
                      ),
                      title: Text(
                        tr('coupons'),
                        style: const TextStyle(
                          fontFamily: 'DINNextLTArabic',
                          fontSize: 17,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),

            const SizedBox(
              height: 5.0,
            ),

            ///تغيير اللغه

            GestureDetector(
              onTap: () =>
                  showSheet(context, const LanguageAccountBottomSheet()),
              child: ListTile(
                leading: Icon(
                  Icons.language,
                  color: Colors.red[700],
                ),
                title: Text(
                  tr('Change the language'),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontSize: 17,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),

            ///سياسة الاستخدام
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const PrivacyPolicy())),
              child: ListTile(
                leading: Icon(
                  Icons.security_outlined,
                  color: Colors.red[700],
                ),
                title: Text(
                  tr('Terms of use'),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontSize: 17,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),

            ///المحادثة
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => const Chatbot()
                    //Homepage(),
                    ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.support_agent,
                  color: Colors.red[700],
                ),
                title: Text(
                  tr('chat'),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontSize: 17,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),

            ///تواصل معنا

            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ContactUs())),
              child: ListTile(
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.red[700],
                ),
                title: Text(
                  tr('contactUs'),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontSize: 17,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),

            ///مشاركة التطبيق

            GestureDetector(
              onTap: () => Share.share('check this out https://hwzn.sa/'),
              child: ListTile(
                leading: Icon(
                  Icons.share_outlined,
                  color: Colors.red[700],
                ),
                title: Text(
                  tr('shareApp'),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTArabic',
                    fontSize: 17,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),

            ///تسجيل الخروج
            //  Navigator.of(context).push(MaterialPageRoute(
            //         builder: (BuildContext context) => Login()));
            GlobalState.instance.get('token') == null
                ? const Offstage()
                : GestureDetector(
                    onTap: () {
                      Dialogs.materialDialog(
                          context: context,
                          title: tr('Do you want to logout ?'),
                          //msg: locale.wantToLogout,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          actions: [
                            IconsOutlineButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: tr('Cancel'),
                              iconData: Icons.cancel_outlined,
                              textStyle: const TextStyle(color: Colors.grey),
                              iconColor: Colors.red,
                            ),
                            IconsButton(
                              onPressed: () async {
                                await EasyLoading.show(status: tr('logout'));
                                final bool logout =
                                    await AuthController.loggingOut(
                                        context,
                                        AuthController.authModel.user?.source !=
                                            null,
                                        source: AuthController
                                            .authModel.user?.source);
                                await EasyLoading.dismiss();
                                if (logout) {
                                  GlobalState.instance.set('token', null);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => CustomerLogin()),
                                    //(route) => false
                                  );
                                } else {
                                  showDialogOperation(tr('Error'),
                                      tr('Error logging out'), context,
                                      onOkButtonPressed: null,
                                      onCancelButtonPressed: () {},
                                      buttonCancelText: tr('Back'));
                                }
                              },
                              text: tr('logout'),
                              iconData: Icons.done,
                              color: Colors.grey,
                              textStyle: const TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ]);
                    },
                    // Share.share('check this out https://hwzn.sa/'),

                    child: ListTile(
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Colors.red[700],
                      ),
                      title: Text(
                        tr('logout'),
                        style: const TextStyle(
                          fontFamily: 'DINNextLTArabic',
                          fontSize: 17,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
