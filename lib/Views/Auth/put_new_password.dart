// ignore_for_file: unnecessary_string_escapes

import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:alrashid_mall_app/utils/entry_field.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../onBoarding/onBoarding3.dart';

class PutNewPassword extends StatelessWidget {
  final String otp;
  final String email;
  PutNewPassword({Key? key, required this.otp, required this.email})
      : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    //var locale = AppLocalizations.of(context);
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
                                    const OnBoarding3())),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                // ignore: use_full_hex_values_for_flutter_colors
                                color: Color(0xff2eb83f48),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: lang ==
                                      'en' // locale.locale.languageCode == 'en'
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          right: mywidth * 0.02),
                                      child: const Icon(Icons.arrow_back_ios),
                                    )
                                  : Padding(
                                      padding:
                                          EdgeInsets.only(left: mywidth * 0.02),
                                      child: const Icon(Icons.arrow_back_ios),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              ///
              Image.asset('assets/images/Alrashid_mall.png',
                  width: 180, height: 160),
              Text(
                tr('Enter new password'), // locale.enterNewPassword!,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: ('DINNextLTArabic'),
                    fontSize: 24.0),
              ),
              const SizedBox(
                height: 20,
              ),

              /// كلمة المرورالجديده
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: EntryField(
                    // hintText : locale.newPassword,
                    isPassword: true,
                    lableText: tr('newPassword'), //locale.newPassword,
                    onChange: (String val) {
                      password = val;
                    },
                    validator: (String? val) {
                      //  return null;
                      tr('Cannot be empty'); //locale.cannotBeEmpty;
                      return null;
                    }),
              ),
              //اعادة ادخال كلمة المرور
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: EntryField(
                    // hintText : locale.reEnterNewPassword,
                    isPassword: true,
                    lableText: tr(
                        'Re-enter your password'), //locale.reEnterNewPassword,
                    onChange: (String val) {
                      confirmPassword = val;
                    },
                    validator: (String? val) {
                      if (val!.isNotEmpty) {
                        return password == val
                            ? null
                            : tr(
                                'The two passwords do not match'); //locale.twoPassNotMatch;
                      }
                      return val.isEmpty
                          ? tr('Cannot be empty') //locale.cannotBeEmpty
                          : null;
                    }),
              ),

              const SizedBox(
                height: 50,
              ),

              ///تسجيل الدخول BUTTON
              InkWell(
                onTap: () async {
                  if (formGlobalKey.currentState!.validate()) {
                    formGlobalKey.currentState!.save();

                    // use the email provided here
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (BuildContext context) => MyBottomNavyBar(
                    //           commingFromSplash: true,
                    //           token: AuthController.authModel.accessToken!,
                    //         )));
                    final bool resetPassword =
                        await AuthController.resetPasswordFunc(context,
                            otp: otp,
                            email: email,
                            password: password!,
                            confirmPass: confirmPassword!);
                    if (resetPassword) {
                      showDialogOperation(
                          tr('Password changed successfully'), // locale.passwordChangedSuccessfully!,
                          "${tr('The password has been successfully changed to') /*locale.thePasswordHasBeenSuccessfullyChangedTo*/} \n$password\n ${tr('Please log in again') /*locale.pleaseLogInAgain*/}",
                          context,
                          dialogType: DialogType.SUCCES,
                          buttonOkText: tr('confirm'), //locale.confirm,
                          onOkButtonPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (c) => CustomerLogin()),
                            (route) => false);
                      }, onCancelButtonPressed: null);
                    }
                  }
                },
                child: Container(
                  width: 350,
                  height: 45,
                  child: Center(
                    child: Text(
                      tr('send'), //locale.send!,
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
        ),
      ),
    );
  }

  bool isEmalValid(String email) {
    return email.length >= 11;
  }

  bool isNewPasswordValid(String newPassword) => newPassword.length >= 6;
  bool isConfirmNewPasswordValid(String confirmNewPassword) =>
      confirmNewPassword.length >= 6;
}
