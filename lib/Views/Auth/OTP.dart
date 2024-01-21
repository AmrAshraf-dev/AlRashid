// ignore_for_file: unnecessary_string_escapes

import 'dart:async';
import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/Views/Auth/put_new_password.dart';
import 'package:alrashid_mall_app/Views/Auth/signup.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/verfiy_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/verfiy_state.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';

import '../onBoarding/onBoarding3.dart';

// ignore: must_be_immutable
class OTP extends StatefulWidget {
  OTP({
    Key? key,
    this.email,
    this.commingSignUP,
    //this.otp,
  }) : super(key: key);
  final String? email;
  final bool? commingSignUP;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String? otp;
  // late Timer _timer;
  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    final VerfiyCubit bloc = BlocProvider.of<VerfiyCubit>(context);
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    bloc.initBloc();
    return Scaffold(
      body: Form(
        key: widget.formGlobalKey,
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Column(
              children: [
                // Text(
                //   email!,
                //   style: TextStyle(
                //       color: Colors.grey[400],
                //       fontWeight: FontWeight.w400,
                //       fontFamily: "AJannatLT",
                //       fontStyle: FontStyle.normal,
                //       fontSize: 24.0),
                // ),
                const SizedBox(
                  height: 45,
                ),
                // PinCodeTextField(
                //   onChanged: (String v) {
                //     otp = v;
                //   },
                //   validator: (String? val) {
                //     return val!.isEmpty
                //         ? 'لا يمكن ان يكون فارغا' /*locale.cannotBeEmpty*/ : null;
                //   },
                //   appContext: context,
                //   length: 6,
                //   errorTextSpace: 40,
                //   obscureText: false,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   pinTheme: PinTheme(
                //     shape: PinCodeFieldShape.box,
                //     borderRadius: BorderRadius.circular(11),
                //     fieldHeight: 58,
                //     fieldWidth: 50,
                //     inactiveFillColor: Colors.grey[100],
                //     errorBorderColor: Colors.red,
                //     selectedFillColor: Colors.transparent,
                //     activeFillColor: Colors.white,
                //   ),
                //   animationDuration: const Duration(milliseconds: 300),
                //   enableActiveFill: true,
                // ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: lang == 'ar' //locale.locale.languageCode == 'en'
                      ? Align(
                          alignment: AlignmentDirectional.centerStart,
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
                              )),
                        )
                      : Align(
                          alignment: AlignmentDirectional.centerStart,
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
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Colors.black,
                              )),
                        ),
                ),
                Image.asset('assets/images/Alrashid_mall.png',
                    width: 180, height: 160),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  tr('enter otp'), // locale.enterOtp!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 24.0),
                ),
                const SizedBox(
                  height: 50,
                ),

                /// OTP FIELDS
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 4,
                    errorTextSpace: 30,
                    obscureText: false,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.black,
                        inactiveColor: Colors.grey,
                        inactiveFillColor: Colors.green,
                        selectedFillColor: Colors.deepPurple,
                        selectedColor: Colors.greenAccent,
                        activeColor: Colors.blue

                        // inactiveFillColor: Colors.grey, // MyColors.gray_100,
                        // errorBorderColor: Colors.grey,
                        //  selectedFillColor: Colors.transparent,
                        // activeFillColor: Colors.white,
                        ),
                    onChanged: (String v) {
                      otp = v;
                    },
                    validator: (String? val) {
                      return val!.isEmpty
                          ? tr('Cannot be empty') //locale.cannotBeEmpty
                          : null;
                    },
                    //  numberOfFields: 4,
                    // borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    //  showFieldAsBox: true,
                    //runs when a code is typed in
                    //  onCodeChanged: (String? code) {
                    //handle validation or checks here
                    //   otp = code!;
                    // (otp) {
                    //   if (isOTP(otp!)) {
                    //     return widget.otp = code;
                    //     //  return null;
                    //   } else {
                    //     return 'لا يمكن ترك الخانات فارغة';
                    //   }
                    // };
                    // },

                    //runs when every textfield is filled
                    // onSubmit: (String verificationCode) {
                    //   showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           title: const Text("رمز التحقق"),
                    //           content:
                    //               Text('الرمز الذي ادخلته هو $verificationCode'),
                    //         );
                    //       });
                    // }, // end onSubmit
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // const SizedBox(
                //   height: 20,
                // ),

                BlocBuilder<VerfiyCubit, VerfiyState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return _start != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "AJannatLT",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    text: tr(
                                        'You can try again after') //"${locale.youCanTryAgainAfter} "
                                    ),
                                TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "AJannatLT",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    text:
                                        "0:$_start ${tr('s') /*locale.second*/}")
                              ])),
                            ],
                          )
                        : InkWell(
                            onTap: () async {
                              /// i should use reset-password-request???
                              // final bool verfiy =
                              //     await AuthController.resendOTPFunc(context,
                              //         email: widget.email!);
                              // if (verfiy) {
                              //   await showDialogOperation(
                              //       /*locale.theCodeHasBeenSent!*/ 'تم ارسال الكود',
                              //       /*locale.pleaseCheckYourEmailAndLogInAgain!,*/ 'من فضلك تأكد من البريد الإلكتروني ثم أعد تسجيل الدخول مرة اخرى',
                              //       context,
                              //       dialogType: DialogType.SUCCES,
                              //       buttonOkText: 'تأكيد', //locale.confirm,
                              //       onOkButtonPressed: () {},
                              //       onCancelButtonPressed: null);
                              // }
                              myResetTimer();
                            },
                            child: Center(
                              child: Text(
                                  tr('Resend again'), // locale.resendAgain!,
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "AJannatLT",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: lang ==
                                          'ar' //locale.locale.languageCode == 'ar'
                                      ? TextAlign.left
                                      : TextAlign.right),
                            ),
                          );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),

                /// MY wORKKKK
                ///

                GestureDetector(
                  onTap: (() async {
                    if (widget.formGlobalKey.currentState!.validate()) {
                      // if (otp == '') {
                      //   showDialogOperation(
                      //       'هناك خطأ', 'لا يمكن ترك الخانات فارغة', context);
                      // }
                      // if (widget.commingSignUP!) {
                      //   final bool verfiy =
                      //       await AuthController.verfiyForSignUPFunc(context,
                      //           otp: widget.otp!, email: widget.email!);
                      //   if (verfiy) {
                      //     showDialogOperation(
                      //         'تم التسجيل بنجاح', //locale.successfullyRegistered!,
                      //         'برجاء التوجه لتسجيل الدخول لتأكيد بياناتك', //locale.relogin!,
                      //         context,
                      //         dialogType: DialogType.SUCCES,
                      //         buttonOkText: 'تأكيد', //locale.confirm,
                      //         onOkButtonPressed: () {
                      //       Navigator.pushReplacement(context,
                      //           MaterialPageRoute(builder: (c) => Login()));
                      //     }, onCancelButtonPressed: null);
                      //   }
                      // }
                      // else {
                      final bool verfiy = await AuthController.verfiyFunc(
                          context,
                          otp: otp! /*?? '1111'*/,
                          email: widget.email!);
                      if (verfiy) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => PutNewPassword(
                                    otp: otp!,
                                    email: widget.email!,
                                  )),
                          //(route) => false
                        );
                      }
                      // }
                    }
                  }),
                  child: Container(
                    width: 350,
                    height: 45,
                    child: Center(
                      child: Text(
                        tr('confirm'), //locale.confirm!,
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
      ),
    );
  }

  bool isOTP(String otp) {
    return otp.isNotEmpty;
  }

  void myResetTimer() {
    _start = 60;

    startTimer();
  }
}
