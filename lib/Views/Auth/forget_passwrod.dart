// ignore_for_file: unnecessary_string_escapes

import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:alrashid_mall_app/Views/Auth/OTP.dart';
import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/utils/entry_field.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({
    Key? key,
    this.emailOrPhoneController,
  }) : super(key: key);
  final formGlobalKey = GlobalKey<FormState>();
  String? emailOrPhoneController;
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
                    ],
                  ),

                  ///
                  Image.asset(
                    'assets/images/Alrashid_mall.png',
                    width: 180,
                    height: 160,
                  ),
                  Text(
                    tr('Forget password text'),
                    //  locale.forgetPasswordText!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// رقم الجوال / البريد الالكترونى
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: EntryField(
                        isPassword: false,
                        lableText: tr(
                            'phoneNumberOrEmail'), //locale.phoneNumberOrEmail!,
                        onChange: (String e) {
                          emailOrPhoneController = e;
                        },
                        validator: (String? v) {
                          return v!.isEmpty
                              ? tr('Cannot be empty') //locale.cannotBeEmpty!
                              : null;
                        }),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  ///تسجيل الدخول BUTTON
                  GestureDetector(
                    onTap: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        //use the email provided here
                        final bool forgetPass =
                            await AuthController.forgetPassFunc(context,
                                email: emailOrPhoneController);
                        if (forgetPass) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => OTP(
                                        email: emailOrPhoneController!,
                                        commingSignUP: false,
                                      )));
                        }
                      }
                    },
                    child: Container(
                      width: 350,
                      height: 45,
                      child: Center(
                        child: Text(
                          tr('send'), //  locale.send!,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isEmalValid(String email) {
    return email.length >= 11;
  }
}
