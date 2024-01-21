import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    //  var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Directionality(
          textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    tr('aboutUs'), // locale.aboutUs!,
                    style: const TextStyle(
                        color: Color(0xff333333),
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 18.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  tr('About us text'), // locale.aboutUsText!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      //letterSpacing: 4.0,
                      height: 1.8,
                      color: Color(0xff222222),
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 17.0),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  tr('About us text2'), //locale.aboutUsText2!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      //   letterSpacing: 4.0,
                      height: 1.8,
                      color: Color(0xff222222),
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 17.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
