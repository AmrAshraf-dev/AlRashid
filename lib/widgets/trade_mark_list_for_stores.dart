import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TradeMarksListForStores extends StatelessWidget {
  final String? token;
  final int? tradeMarkId;
  final String? name;

  const TradeMarksListForStores({
    Key? key,
    this.token,
    this.tradeMarkId,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Directionality(
      textDirection: lang == 'en' //locale!.locale.languageCode == 'en'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Text(
        name ?? 'network failed',
        style: const TextStyle(
            color: Color(0xff333333),
            fontFamily: ('DINNextLTArabic'),
            fontSize: 13.0),
      ),
    );
  }
}
