import 'package:alrashid_mall_app/api/controllers/err_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/endpoints.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/coupons_model.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class CouponsController {
  static CouponsModel couponsModel = CouponsModel();
  static Places placesModel = Places();
  static Future<bool> getCouponsData(
      BuildContext context, String? token) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    print(
        'global state token coupons controller : ${GlobalState.instance.get('token')}');
    try {
      final http.Response response = await http.get(
        Uri.parse(EndPointsUrls.couponsUrl),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${GlobalState.instance.get('token')}",
        },
      );

      await EasyLoading.dismiss();
      return _responseResult(context, response, "coupons", lang);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          onCancelButtonPressed: () async {
        //   await ERRController().sendingERRToServer(
        //       token: AuthController.authModel.accessToken ?? '0',
        //       endPoint: EndPointsUrls.getHomeProducts(limit: limit),
        //       body: e.toString(),
        //       locale: locale);
      }, onOkButtonPressed: () {});
      if (kDebugMode) {
        print('$e in getCouponsData func');
      }
      return false;
    }
  }

  static Future<bool> _responseResult(
      BuildContext context, http.Response response, String model, lang) async {
    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      switch (model) {
        case "coupons":
          {
            print("==============>> 2222 couponsModel ${response.body}");
            couponsModel = couponsModelFromJson(response.body);
            print("==============>> couponsModel $couponsModel");
          }
          break;
      }

      return true;
    }
    // if (response.statusCode == 401) {
    //   showDialogOperation(
    //       locale!.youHaveExpired!, locale.pleaseGoToLogInAgain!, context,
    //       onCancelButtonPressed: () async {
    //     // await DataInLocal.clearShared();
    //     // Navigator.pushAndRemoveUntil(
    //     //   context,
    //     //   MaterialPageRoute(builder: (c) => Login()),
    //     //   (route) => false,
    //     // );
    //   },
    //       onOkButtonPressed: null,
    //       dismissOnBackKeyPress: false,
    //       dismissOnTouchOutside: false,
    //       buttonCancelText: locale.signIn!);
    //   return false;
    // }

    if (response.statusCode >= 400 && response.statusCode < 500) {
      return ERRController().errMessageFunc(context, response, lang);
    }
    showDialogOperation(
        tr('Error'), "${response.statusCode}\n${tr('Server_Err')}", context,
        //    onCancelButtonPressed: () async {
        //   await ERRController().sendingERRToServer(
        //       token: AuthController.authModel.accessToken ?? '0',
        //       endPoint: response.request!.url.path,
        //       body: response.body,
        //       locale: locale);
        //},
        onOkButtonPressed: () {});
    return false;
  }
}
