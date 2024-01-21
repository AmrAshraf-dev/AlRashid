import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/Views/onBoarding/onBoarding3.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/slide_animations.dart';
import 'onBoarding2.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Directionality(
        textDirection: lang == 'en' //locale!.locale.languageCode == 'en'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/slider2.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(top: myheight * 0.4),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      tr('theWorldIsBetweenYourHands'), // locale.theWorldIsBetweenYourHands!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: ('DINNextLTArabic'),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      tr('theWorldIsBetweenYourHands'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xffa6a6a6),
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 24.0),
                    ),
                    Text(
                      tr('unforgetableDay'), //locale.unforgetableDay!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xffa6a6a6),
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 24.0),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context, SlideLeftRoute(page: const OnBoarding3())),
                      // child: Stack(
                      // children: [
                      // Center(
                      //   child: Container(
                      //     width: 90,
                      //     height: 90,
                      //     decoration: BoxDecoration(
                      //       borderRadius: const BorderRadius.only(
                      //         //  Radius.circular(100),
                      //         topRight: Radius.circular(40.0),
                      //       ),
                      //       border: Border.all(
                      //         width: 4,
                      //         color: const Color(0xffb83f48),
                      //         style: BorderStyle.solid,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Center(
                      child: SizedBox(
                        width: 95,
                        child: CircleProgressBar(
                          value: 0.5,
                          foregroundColor: const Color(0xffb83f48),
                          backgroundColor: Colors.transparent,
                          child: Center(
                            child: Container(
                              //margin: const EdgeInsets.only(top: 10.0),
                              //alignment: Alignment.center,
                              width: 70.0,
                              height: 70.0,
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(50.0),
                                shape: BoxShape.circle,
                                color: Color(0xffb83f48),
                              ),
                              child: lang ==
                                      'en' //locale.locale.languageCode == 'en'
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          right: mywidth * 0.02),
                                      child: lang ==
                                              'en' //locale.locale.languageCode == 'en'
                                          ? const Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                            ))
                                  : Padding(
                                      padding:
                                          EdgeInsets.only(left: mywidth * 0.02),
                                      child: lang ==
                                              'en' // locale.locale.languageCode == 'en'
                                          ? const Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                            )),
                            ),
                          ),
                        ),
                      ),
                      //),
                      // ],
                      // ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CustomerLogin())),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                            lang == 'en' // locale.locale.languageCode == 'en'
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      tr('skip'), //locale.skip!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: ('DINNextLTArabic'),
                                          fontSize: 18.0),
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      tr('skip'), //locale.skip!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: ('DINNextLTArabic'),
                                          fontSize: 18.0),
                                    ),
                                  ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
