import 'package:alrashid_mall_app/Views/UI/Profile/profile-nologin.dart';
import 'package:alrashid_mall_app/api/controllers/auth_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:alrashid_mall_app/utils/entry_field.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUs extends StatelessWidget {
  String? nameController;
  String? emailController;
  String? phoneNumberController;
  String? messageController;
  ContactUs({
    Key? key,
    this.nameController,
    this.emailController,
    this.phoneNumberController,
    this.messageController,
  }) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();
  final maxLines = 5;
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
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Align(
                      alignment: Alignment.topRight,
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
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    tr('contactUs'), // locale.contactUs!,
                    style: const TextStyle(
                        color: Color(0xff333333),
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 18.0),
                  ),
                ],
              ),

              ///
              /// الاسم
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: EntryField(
                    keyboardType: TextInputType.text,
                    isPassword: false,
                    lableText: tr('userName'),
                    onChange: (String v) {
                      nameController = v;
                    },
                    validator: (String? v) {
                      return v!.isEmpty ? tr('Cannot be empty') : null;
                    }),
              ),

              /// البريد الالكترونى

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: EntryField(
                    keyboardType: TextInputType.emailAddress,
                    isPassword: false,
                    lableText: tr('Email'),
                    onChange: (String v) {
                      emailController = v;
                    },
                    validator: (String? v) {
                      return v!.isEmpty ? tr('Cannot be empty') : null;
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: EntryField(
                    keyboardType: TextInputType.number,
                    isPassword: false,
                    lableText: tr('Phone number'),
                    onChange: (String v) {
                      phoneNumberController = v;
                    },
                    validator: (String? v) {
                      return v!.isEmpty ? tr('Cannot be empty') : null;
                    }),
              ),
              const SizedBox(
                height: 30,
              ),

              ///رسالتك
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tr('Your message'),
                  style: const TextStyle(
                      color: Color(0xff222222),
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                ),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  height: maxLines * 40.0,
                  child: TextFormField(
                    onChanged: (String v) {
                      messageController = v;
                    },
                    maxLines: maxLines,
                    style: const TextStyle(
                      fontFamily: ('DINNextLTArabic'),
                      //  height: 10,
                    ),
                    decoration: InputDecoration(
                      isDense: true,

                      hintText: tr('Enter your message here'),
                      hintStyle: const TextStyle(
                        color: Color(0xffc0c0c0),
                        fontSize: 13.0,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xfff2f2f2),
                          width: 2.0,
                        ),
                      ),
                      //focusColor: Color(0xfff2f2f2),
                    ),
                    validator: (message) {
                      if (isMessage(message!)) {
                        return null;
                      } else {
                        return tr('Cannot be empty');
                      }
                    },
                  ),
                ),
              ),

              ///ارسال
              GestureDetector(
                onTap: () async {
                  if (formGlobalKey.currentState!.validate()) {
                    final bool contactUs = await AuthController.contactUsfunc(
                      context,
                      phoneNumber: phoneNumberController?.trim(),
                      email: emailController?.trim(),
                      name: nameController?.trim(),
                      yourMessage: messageController?.trim(),
                    );
                    if (contactUs) {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (c) => ProfileNoLogin()));
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.SUCCES,
                        // animType: AnimType.rightSlide,,
                        title: tr('Successful entry'),
                        //   desc: 'Dialog description here.............',
                        btnOkText: tr('confirm'),
                        btnOkOnPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const ProfileNoLogin()));
                        },
                      ).show();
                    }
                  }
                  formGlobalKey.currentState!.save();
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 350,
                    height: 45,
                    child: Center(
                      child: Text(
                        tr('send'),
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
            ],
          ),
        ),
      ),
    );
  }

  bool isName(String name) => name.isNotEmpty;
  bool isEmail(String email) => email.isNotEmpty;
  bool isMobile(String mobile) {
    return mobile.length >= 11;
  }

  bool isMessage(String message) => message.isNotEmpty;
}
