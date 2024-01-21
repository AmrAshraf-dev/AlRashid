import 'dart:io';
import 'package:alrashid_mall_app/Views/Auth/forget_passwrod.dart';
import 'package:alrashid_mall_app/Views/Auth/signup.dart';
import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/database.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/select_user/select_user_imports.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/widgets/MyText.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/login/login_imports.dart';

import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/register/register_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/splash/splash_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/welcome_page/WelcomePageImports.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/utils/entry_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../onBoarding/onBoarding3.dart';

// ignore: must_be_immutable
class CustomerLogin extends StatelessWidget {
  CustomerLogin({
    Key? key,
  }) : super(key: key);
  static final formGlobalKey = GlobalKey<FormState>();
  String? emailOrPhoneController;
  String? passwordController;

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // var locale = AppLocalizations.of(context);
    //DataInLocal.useValueToNavigate(context);
    var myNavigatorKey = GlobalState.instance.navigatorKey;
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Directionality(
          textDirection: lang == 'ar' //locale?.locale.languageCode == 'en'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const OnBoarding3())),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: const Color(0xff2eb83f48),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 18,
                                color: Colors.black,
                              ))),
                      GestureDetector(
                        onTap: () async {
                          await DataInLocal.clearShared();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => MyBottomNavyBar(
                                      token: '0',
                                      commingFromSplash: true,
                                    )),
                            //(r) => false
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            tr('skip'), //locale?.skip ?? '',
                            style: const TextStyle(
                                color: Color(0xff929292),
                                fontFamily: ('DINNextLTArabic'),
                                fontSize: 14.0),
                          ),
                        ),
                      ),
                    ],
                  ),

                  ///
                  Image.asset(
                    'assets/images/Alrashid_mall.png',
                    width: 170,
                    height: 170,
                  ),
                  Text(
                    tr('SignIn'), //locale?.signIn ?? '',
                    style: const TextStyle(
                        color: Color(0xffb83f48),
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// رقم الجوال / البريد الالكترونى
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: EntryField(
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        lableText: tr(
                            'phoneNumberOrEmail'), //locale?.phoneNumberOrEmail ?? '',
                        onChange: (String e) {
                          emailOrPhoneController = e;
                        },
                        // fieldTextEditingController: emailOrPhoneController,
                        // validator: (email) {
                        //   if (isEmalValid(email!)) {
                        //     return null;
                        //   } else {
                        //     return 'من فضلك ضع بريد الكتروني او رقم صحيح';
                        //   }
                        // },
                        validator: (String? v) {
                          return v!.isEmpty
                              ? tr(
                                  'Cannot be empty') //locale?.cannotBeEmpty ?? ''
                              : null;
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///كلمة المرور
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: EntryField(
                        isPassword: true,
                        lableText: tr('password'), //locale?.password ?? '',
                        onChange: (String p) {
                          passwordController = p;
                        },
                        //fieldTextEditingController: passwordController,
                        // validator: (password) {
                        //   if (isPasswordValid(password!)) {
                        //     return null;
                        //   } else {
                        //     return 'من فضلك أدخل كلمة مرور لا تقل عن 6 احرف او ارقام';
                        //   }
                        // },
                        validator: (String? v) {
                          return v!.isEmpty
                              ? tr(
                                  'Cannot be empty') //locale?.cannotBeEmpty ?? ''
                              : null;
                        }),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  ///نسيت كلمة المرور
                  InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ForgetPassword())),
                    child: Padding(
                      padding: lang == 'en'
                          ? EdgeInsets.only(right: mywidth * 0.6)
                          : EdgeInsets.only(left: mywidth * 0.6),
                      child: Text(
                        tr('forgetPassword'), // locale?.forgetPassword ?? '',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black38,
                            fontFamily: ('DINNextLTArabic'),
                            fontSize: 13.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///تسجيل الدخول BUTTON
                  GestureDetector(
                    onTap: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        final bool auth = await AuthController.loginFunc(
                            context,
                            phoneNumber: emailOrPhoneController
                                ?.trim(), //?? 'amr1@gmail.com',
                            password:
                                passwordController?.trim()); //??'123456789'

                        if (auth) {
                          print("=================auth===>>>$auth");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (c) => MyBottomNavyBar(
                                      commingFromSplash: true,
                                      token: AuthController
                                              .authModel.accessToken ??
                                          '',
                                    )),
                            //(route) => false
                          );
                          print(
                              'tokkkkkkeeeeennnnn : ${AuthController.authModel.accessToken}');
                        }
                      }
                      formGlobalKey.currentState!.save();
                      // use the email provided here
                      //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //       builder: (BuildContext context) =>
                      //           const MyBottomNavyBar()));
                      // }
                      // ;
                    },
                    child: Container(
                      width: 350,
                      height: 45,
                      child: Center(
                        child: Text(
                          tr('SignIn'), // locale?.signIn ?? '',
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
                  const SizedBox(
                    height: 20,
                  ),

                  /// الدخول كموظف
                  // GestureDetector(
                  //   onTap: () async {
                  //     // Navigator.of(GlobalContext)
                  //     //     .pushReplacement(
                  //     //         MaterialPageRoute(builder: (_) => WelcomePage()));
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => //const Splash()
                  //               //  WelcomePage()
                  //             //  Login(),
                  //           SelectUser()
                  //         ));
                  //     // AutoRouter.of(context).push(const SplashRoute());
                  //     // AutoRouter.of(context).push(const SelectUserRoute());
                  //   },
                  //   child: Container(
                  //     width: 350,
                  //     height: 45,
                  //     child: Center(
                  //       child: Text(
                  //         locale.loginAsEmployee!,
                  //         style: const TextStyle(
                  //           color: Color(0xffb83f48),
                  //           fontFamily: ('DINNextLTArabic'),
                  //           fontSize: 18.0,
                  //         ),
                  //       ),
                  //     ),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: const Color(0xffb83f48),
                  //       ),
                  //       borderRadius: BorderRadius.circular(22),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  ///أو استخدم
                  Text(
                    tr('orUse'),
                    //locale?.orUse ?? '',
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //APPLE ICON

                      Platform.isIOS
                          ? GestureDetector(
                              onTap: () async {
                                var resposne =
                                    await AuthController.appleSignIn(context);
                                if (resposne != false) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => MyBottomNavyBar()),
                                      (route) => false);
                                }
                                // await AuthController.appleTestSignIn(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: const Color(0xffb83f48))),
                                child: Image.asset(
                                  'assets/icons/apple_pay.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: 15.0,
                            ),

                      ///GOOGLE ICON
                      GestureDetector(
                        onTap: () async {
                          //_googleSignIn.signOut();
                          final bool login =
                              await AuthController.loginWithGOOGLE(context);
                          if (login) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => MyBottomNavyBar(
                                      token:
                                          AuthController.authModel.accessToken!,
                                      commingFromSplash: true)),
                              //(route) => false
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xffb83f48))),
                          child: Image.asset(
                            'assets/icons/google_logo.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),

                      /// FACEBOOK ICON

                      GestureDetector(
                          onTap: () async {
                            final bool login =
                                await AuthController.loginWithFACEBOOK(context);
                            if (login) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => MyBottomNavyBar(
                                        token: AuthController
                                            .authModel.accessToken!,
                                        commingFromSplash: true)),
                                //(route) => false
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: const Color(0xffb83f48))),
                            child: Image.asset(
                              'assets/icons/facebook.png',
                              width: 35,
                              height: 35,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr('You don’t have an account yet!'),
                        // locale?.youDontHaveAnAccYet ?? '',
                        style: const TextStyle(
                          color: Color(0xffc5c5c5),
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) => SignUp())),
                        child: Text(
                          tr('Sign up now!'),
                          //locale?.signUpNow ?? '',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xffb83f48),
                            fontFamily: ('DINNextLTArabic'),
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isPasswordValid(String password) => password.length >= 6;
  bool isEmalValid(String email) {
    return email.length >= 11;
    // Pattern pattern =
    //     '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$';
    // RegExp regex = RegExp(pattern.toString());
    // return regex.hasMatch(email);
  }
}

// mixin InputValidationMixin {
//   bool isPasswordValid(String password) => password.length >= 6;

//   bool isEmailValid(String email) {
//     Pattern pattern =
//         '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$';
//     RegExp regex = RegExp(pattern.toString());
//     return regex.hasMatch(email);
//   }
// }
