import 'dart:convert';
import 'dart:developer';

import 'package:alrashid_mall_app/api/body/auth_body.dart';
import 'package:alrashid_mall_app/api/controllers/err_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/auth_model.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class PurchaseValueController {
  static AuthModel authModel = AuthModel();
  static Future<bool> purchaseValueFunc(BuildContext context,
      {int? invoiceId, int? amount}) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('loading'));
      final http.Response response = await http.post(
          Uri.parse("https://alrashid.hwzn.sa/api/confirm-price"),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            "Authorization": "Bearer ${GlobalState.instance.get("token")}",
          },
          body: json.encode(AuthBody.purchaseValueBodyMap(
              invoiceId: invoiceId ?? 0, amount: amount ?? 0)));
      print(
          'auth : ${AuthBody.purchaseValueBodyMap(invoiceId: invoiceId ?? 0, amount: amount ?? 0)}');

      await EasyLoading.dismiss();

      return _responseResult(response, context, lang);
    } catch (e) {
      await EasyLoading.dismiss();
      log('$e in login func');
      return false;
    }
  }

  static Future<bool> _responseResult(
    http.Response response,
    BuildContext context,
    lang,
  ) async {
    log(response.body);
    print("======================>>>>>>>>>>>>>res ${response.body}");
    GlobalState.instance.set("bill", response.body);

    log(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    if (response.statusCode >= 400 && response.statusCode < 500) {
      return ERRController().errMessageFunc(context, response, lang);
    }
    log(response.request!.url.path);
    showDialogOperation(
        tr('Error'), "${response.statusCode}\n${tr('Server_Err')}", context,
        onOkButtonPressed: () {});
    return false;
  }
}
