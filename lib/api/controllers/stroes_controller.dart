import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/api/headers.dart';
import 'package:alrashid_mall_app/database.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/endpoints.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/Stores_model.dart';
import 'package:alrashid_mall_app/models/stores_details_model.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class StoresController {
  static StoresModel storesModel = StoresModel();
  static MySinglePlaceModel mySinglePlaceModel = MySinglePlaceModel();
  static Future<bool> getStoresData(BuildContext context, String? token) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      final http.Response response = await http.get(
        Uri.parse(EndPointsUrls.storesUrl),
        headers: token == null || token == '0'
            ? null
            : EndPointHeaders.contentTypeAndTokenMap(token),
      );
      print('EndPointsUrls ${EndPointsUrls.storesUrl}');
      await EasyLoading.dismiss();
      return _responseResult(context, response, "stores", lang);
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
        print('$e in getStoresData func');
      }
      return false;
    }
  }

  static Future<bool> getStoresDetails(
      BuildContext context, String? tokenController, String id) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    if (kDebugMode) {
      print(id);
    }
    try {
      final http.Response response = await http.get(
        Uri.parse(EndPointsUrls.storesDetailsUrl(id)),
        headers: tokenController == null || tokenController == '0'
            ? null
            : EndPointHeaders.contentTypeAndTokenMap(tokenController),
      );
      // await EasyLoading.dismiss();
      return _responseResult(context, response, "stores_details", lang);
    } catch (e) {
      //await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          onCancelButtonPressed: () async {
        //   await ERRController().sendingERRToServer(
        //       token: AuthController.authModel.accessToken ?? '0',
        //       endPoint: EndPointsUrls.getSectionProducts(id),
        //       body: e.toString(),
        //       locale: locale);
      }, onOkButtonPressed: () {});
      if (kDebugMode) {
        print('$e in getStoresDetails func');
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
        case "stores":
          {
            storesModel = storesModelFromJson(response.body);
          }
          break;
        case 'stores_details':
          {
            mySinglePlaceModel = mySinglePlaceModelFromJson(response.body);
          }
          break;
      }

      return true;
    }
    if (response.statusCode == 401) {
      showDialogOperation(
          tr('You have expired'), tr('Please go to log in again'), context,
          onCancelButtonPressed: () async {
        await DataInLocal.clearShared();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => CustomerLogin()),
          (route) => false,
        );
      },
          onOkButtonPressed: null,
          dismissOnBackKeyPress: false,
          dismissOnTouchOutside: false,
          buttonCancelText: tr('SignIn'));
      return false;
    }

    // if (response.statusCode >= 400 && response.statusCode < 500) {
    //   return ERRController().errMessageFunc(context, response, locale);
    // }
    // showDialogOperation(locale?.error! ?? "خطأ",
    //     "${response.statusCode}\n${locale?.serverERR ?? "خطأ"}", context,
    //     //    onCancelButtonPressed: () async {
    //     //   await ERRController().sendingERRToServer(
    //     //       token: AuthController.authModel.accessToken ?? '0',
    //     //       endPoint: response.request!.url.path,
    //     //       body: response.body,
    //     //       locale: locale);
    //     //},
    //     onOkButtonPressed: () {});
    return false;
  }
}
