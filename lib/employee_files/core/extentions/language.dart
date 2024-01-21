// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_tdd/core/bloc/lang_cubit/lang_cubit.dart';
// import 'package:flutter_tdd/core/helpers/di.dart';
// import 'package:flutter_tdd/core/helpers/global_context.dart';
// import 'package:flutter_tdd/core/models/languge/language_model.dart';
//
// import '../models/language/language.dart';
//
// extension StringTranslation on LanguageModel{
//
//   String getValue(){
//     BuildContext context = getIt<GlobalContext>().context();
//     var lang = context.read<LangCubit>().state.locale.languageCode;
//     if (lang == "ar") {
//       return ar??"";
//     }else{
//       return en??"";
//     }
//   }
//
// }