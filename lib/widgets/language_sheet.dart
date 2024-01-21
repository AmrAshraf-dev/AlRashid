import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/language_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageAccountBottomSheet extends StatelessWidget {
  const LanguageAccountBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LanguageCubit _lang = BlocProvider.of<LanguageCubit>(context);
    // AppLocalizations? locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(tr('Change the language'),
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "DINNextLTArabic",
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
          BlocBuilder<LanguageCubit, Locale>(
            bloc: _lang,
            builder: (context, state) {
              return GestureDetector(
                onTap: () async {
                  _lang.selectArabicLanguage();
                },
                child: Text(
                  "English",
                  style: state.languageCode == 'en'
                      ? const TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "DINNextLTArabic",
                          fontSize: 16.0)
                      : const TextStyle(
                          color: Color(0xffb83f48),
                          //  fontWeight: FontWeight.w700,
                          fontFamily: "DINNextLTArabic",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                ),
              );
            },
          ),
          BlocBuilder<LanguageCubit, Locale>(
            bloc: _lang,
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  _lang.selectEngLanguage();
                },
                child: Text(
                  "العربية",
                  style: state.languageCode == 'ar'
                      ? const TextStyle(
                          //   fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: "DINNextLTArabic",
                          fontSize: 16.0)
                      : const TextStyle(
                          color: Color(0xffb83f48),
                          //  fontWeight: FontWeight.w700,
                          fontFamily: "DINNextLTArabic",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                ),
              );
            },
          ),
          const SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }
}
