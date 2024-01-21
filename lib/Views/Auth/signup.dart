import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/database.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/utils/entry_field.dart';
import 'package:alrashid_mall_app/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import 'dart:io';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:toast/toast.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  static final formGlobalKey = GlobalKey<FormState>();
  bool showErrorMessage = false;
  String? nameController;
  String? emailController;
  String? passwordController;
  String? phoneNumberController;
  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    //  var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Form(
        key: formGlobalKey,
        child: Directionality(
          textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
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
                                      CustomerLogin())),
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
                      InkWell(
                        onTap: () async {
                          await DataInLocal.clearShared();
                          Navigator.push(
                            //AndRemoveUntil
                            context,
                            MaterialPageRoute(
                                builder: (c) => MyBottomNavyBar(
                                      token: '0',
                                      commingFromSplash: true,
                                    )),
                            // (r) => false
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            tr('skip'), //locale.skip!,
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
                    tr('createNewAccount'), //locale.createNewAcc!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// الاسم
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: EntryField(
                        keyboardType: TextInputType.text,
                        isPassword: false,
                        lableText: tr('userName'), //locale.userName,
                        onChange: (String n) {
                          nameController = n;
                        },
                        // validator: (String? n) {
                        //   return n!.isEmpty ? locale.cannotBeEmpty : null;
                        // }
                        // myInputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //     RegExp(r"[a-zA-Z]+|\s"),
                        //   )
                        // ],
                        validator: (String? val) {
                          if (val!.length < 2) {
                            return tr(
                                'name validation'); //locale.nameValidation;
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///email
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: EntryField(
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        lableText: tr('Email'), //locale.email,
                        onChange: (String? e) {
                          emailController = e;
                        },
                        // validator: (String? v) {
                        //   return v!.isEmpty ? locale.cannotBeEmpty : null;
                        // }
                        validator: (String? value) {
                          if (!value!.contains('@')) {
                            return tr(
                                'email validation'); //locale.emailValidation;
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///phone
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: EntryField(
                        keyboardType: TextInputType.number,
                        isPassword: false,
                        lableText: tr('Phone number'), //locale.phoneNum,
                        onChange: (String m) {
                          phoneNumberController = m;
                        },
                        // validator: (String? v) {
                        //   return v!.isEmpty ? locale.cannotBeEmpty : null;
                        // }),
                        validator: (String? v) {
                          var regex = RegExp(
                              r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})');
                          if (v == null || v.length > 10) {
                            return tr(
                                'phoneValidation'); //locale.phoneValidation;
                          } else if (!regex.hasMatch(v)) {
                            return tr(
                                'phoneValidation'); //locale.phoneValidation;
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///كلمة المرور
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: EntryField(
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        lableText: tr('Password'), //locale.password,
                        onChange: (String p) {
                          passwordController = p;
                        },
                        // validator: (String? isPasswordValid) {
                        //   return isPasswordValid!.isEmpty
                        //       ? locale.cannotBeEmpty
                        //       : null;
                        // }
                        validator: (String? isPasswordValid) {
                          var regex =
                              RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
                          if (isPasswordValid == null ||
                              isPasswordValid.length < 8) {
                            return tr(
                                'password validation'); //locale.passwordValidation;
                          } else if (!regex.hasMatch(isPasswordValid)) {
                            return tr(
                                'password validation'); //locale.passwordValidation;
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  //أوافق على الشروط والاحكام وسياسة الخصوصيه
                  const MyCheckBox(),
                  const SizedBox(
                    height: 20,
                  ),

                  ///تسجيل حساب جديد BUTTON
                  GestureDetector(
                    onTap: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        final bool signUp = await AuthController.signUpFunc(
                          context,
                          phoneNumber: phoneNumberController?.trim(),
                          password: passwordController?.trim(),
                          email: emailController?.trim(),
                          name: nameController?.trim(),
                        );
                        if (signUp) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => MyBottomNavyBar(
                                        commingFromSplash: true,
                                        token: AuthController
                                                .signUpModel.accessToken ??
                                            '',
                                      )),
                              (route) => false);
                        }
                      }
                      //formGlobalKey.currentState!.save();
                      // if (checkboxValue != true) {
                      //   setState(() => showErrorMessage = true);
                      // } else {
                      //   setState(() => showErrorMessage = false);
                      // }
                      // use the email provided here
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (BuildContext context) => MyBottomNavyBar(
                      //           commingFromSplash: true,
                      //           token: AuthController.authModel.accessToken!,
                      //         ))
                      //         );
                    },
                    child: Container(
                      width: 350,
                      height: 45,
                      child: Center(
                        child: Text(
                          tr('createNewAccount'), //locale.createNewAcc!,
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr('SignUp'), // locale.signUp!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 13.0,
                        ),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        tr('As a brand employee!'), //locale.brandEmployee!,
                        style: const TextStyle(
                          color: Color(0xffb83f48),
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 13.0,
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

  // bool isPasswordValid(String password) => password.length >= 6;
  // bool isMobile(String mobile) {
  //   return mobile.length >= 11;
  //   // Pattern pattern =
  //   //     '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\$';
  //   // RegExp regex = RegExp(pattern.toString());
  //   // return regex.hasMatch(email);
  // }

  // bool isName(String name) => name.isNotEmpty;
  // bool isEmail(String email) => email.isNotEmpty;

  // showToast() {
  //   Fluttertoast.showToast(
  //       msg: "يجب قبول الشروط و الاحكام",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.grey,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }
}

// // ignore: camel_case_extensions
// extension extString on String {
//   bool get isValidEmail {
//     final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//     return emailRegExp.hasMatch(this);
//   }

//   bool get isValidName {
//     final nameRegExp =
//         RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
//     return nameRegExp.hasMatch(this);
//   }

//   bool get isValidPassword {
//     final passwordRegExp = RegExp(
//         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
//     return passwordRegExp.hasMatch(this);
//   }

//   bool get isNotNull {
//     return this != null;
//   }

//   bool get isValidPhone {
//     final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
//     return phoneRegExp.hasMatch(this);
//   }
// }
