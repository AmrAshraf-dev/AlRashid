import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  final String? locale;
  LanguageCubit(this.locale)
      : super(locale != null ? Locale(locale) : const Locale('ar'));

  void selectEngLanguage() {
    emit(const Locale('en'));
  }

  void selectArabicLanguage() {
    emit(const Locale('ar'));
  }

  
}
