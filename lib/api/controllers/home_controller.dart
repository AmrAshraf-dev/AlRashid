import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/api/controllers/err_controller.dart';
import 'package:alrashid_mall_app/api/headers.dart';
import 'package:alrashid_mall_app/database.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/endpoints.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/home_model.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomeController {
  static HomeModel homeModel = HomeModel();
  static Sliders slidersModel = Sliders();
  static ServicesModel servicesModel = ServicesModel();
  static StoresPlacesModel storesPlacesModel = StoresPlacesModel();
  static Future<bool> getHomeData(BuildContext context, String? token) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      final http.Response response = await http.get(
        Uri.parse(EndPointsUrls.homeURL),
        headers: token == null || token == '0'
            ? null
            : EndPointHeaders.contentTypeAndTokenMap(token),
      );
      // await EasyLoading.dismiss();
      return _responseResult(context, response, "home", lang);
    } catch (e) {
      //await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //     onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.getHomeProducts(limit: limit),
          //       body: e.toString(),
          //       locale: locale);
          // },
          onOkButtonPressed: () {});
      if (kDebugMode) {
        print('$e in getHomeProducts func');
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
        case "home":
          {
            homeModel = homeModelFromJson(response.body);
          }
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

    if (response.statusCode >= 400 && response.statusCode < 500) {
      return ERRController().errMessageFunc(context, response, lang);
    }
    showDialogOperation(
        tr('Error'), "${response.statusCode}\n${tr('Server_Err')}", context,
        //     onCancelButtonPressed: () async {
        //   await ERRController().sendingERRToServer(
        //       token: AuthController.authModel.accessToken ?? '0',
        //       endPoint: response.request!.url.path,
        //       body: response.body,
        //       locale: locale);
        // },
        onOkButtonPressed: () {});
    return false;
  }
}
