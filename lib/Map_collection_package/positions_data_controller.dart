import 'dart:convert';
import 'dart:developer';

import 'package:alrashid_mall_app/api/body/auth_body.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/lines_model.dart';
import 'package:alrashid_mall_app/models/route_position.dart';
import 'package:alrashid_mall_app/models/shop_position.dart';
import 'package:flutter/material.dart';
import 'package:alrashid_mall_app/api/controllers/err_controller.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class PositionsController {
  static List<ShopPositionModel> shopPostionModel = [];
  static List<RoutePositionModel> routePositionModel = [];
  static List<LinesModel> lines = [];
  static LinesModel? line;

  /// POSITIONS DATA
  static Future<bool> getPositionsData(
    BuildContext context, {
    int? floor,
  }) async {
    log('FLOOR IN SHOPS::==>> $floor');
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    print('https://alrashid.hwzn.sa/api/places?floor=$floor');
    try {
      final http.Response response = await http.get(
        Uri.parse('https://alrashid.hwzn.sa/api/places?floor=$floor'
            //'https://maps.abou7agar.me/api/places?floor=$floor'
            ),
        headers: {
          'Accept': 'application/json',
          //"Authorization": "Bearer ${GlobalState.instance.get('token')}",
        },
      );

      await EasyLoading.dismiss();
      return await _responseResult(context, response, "postions", lang);
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
        print('$e in getPostionsData func');
      }
      return false;
    }
  }

  /// ROUTES DATA
  static Future<bool> getRoutesData(BuildContext context,
      {int? fromId, int? toId, int? floor}) async {
    log('fromID::==>> $fromId');
    log('toID::==>> $toId');
    log('FLOOR IN ROUTES::==>> $floor');
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      // final queryParameters = {
      //   'from_id': 1,
      //   'to_id': 7,
      // };
      print(
          'https://alrashid.hwzn.sa/api/routes?from_id=$fromId&to_id=$toId&floor=$floor');
      final http.Response response = await http.get(
        Uri.parse(
            'https://alrashid.hwzn.sa/api/routes?from_id=$fromId&to_id=$toId&floor=$floor'
            // 'https://maps.abou7agar.me/api/routes?from_id=$fromId&to_id=$toId&floor=$floor'

            ),
        headers: {
          'Accept': 'application/json',
          //"Authorization": "Bearer ${GlobalState.instance.get('token')}",
        },
      );
      print(
          'https://alrashid.hwzn.sa/api/routes?from_id=$fromId&to_id=$toId&floor=$floor');
      await EasyLoading.dismiss();
      return await _responseResult(context, response, "routes", lang);
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
        print('$e in getRoutesData func');
      }
      return false;
    }
  }

  ///getLinesData
  static Future<bool> getLinesData(BuildContext context) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;

    try {
      final http.Response response = await http.get(
        Uri.parse('https://alrashid.hwzn.sa/api/lines'
            //'https://maps.abou7agar.me/api/lines'
            ),
        headers: {
          'Accept': 'application/json',
          //"Authorization": "Bearer ${GlobalState.instance.get('token')}",
        },
      );

      await EasyLoading.dismiss();
      return await _responseResult(context, response, "lines", lang);
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
        print('$e in getLinesData func');
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
        case 'postions':
          {
            print("==============>> postions data ${response.body}");
            shopPostionModel = shopPositionModelFromJson(response.body);
            print('Shop Pointers Location After');
          }
          break;
        case 'routes':
          print("==============>> routes data ${response.body}");
          routePositionModel = routePositionModelFromJson(response.body);
          break;
        case 'lines':
          print("==============>> lines data ${response.body}");
          lines = linesModelFromJson(response.body);
          line = lines.last;
      }

      return true;
    }

    // if (response.statusCode >= 400 && response.statusCode < 500) {
    //   return ERRController().errMessageFunc(context, response, locale);
    // }
    // showDialogOperation(locale?.error! ?? "خطأ",
    //     "${response.statusCode}\n${locale?.serverERR ?? "خطأ"}", context,
    //     onOkButtonPressed: () {});
    return false;
  }

  // POST SHOP POSITIONS DATA
  static Future<bool> insertShopPostionFunc(
    BuildContext context, {
    dynamic xpoint,
    dynamic ypoint,
    dynamic floor,
    String? nameEn,
    String? code,
    String? type,
    dynamic screenWidth,
    dynamic screenHeight,
    dynamic rotateAngle,
  }) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('loading'));
      final http.Response response = await http.post(
          Uri.parse('https://alrashid.hwzn.sa/api/places'
              //'https://maps.abou7agar.me/api/places'
              ),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'x_point': xpoint,
            'y_point': ypoint,
            'floor': floor,
            'name_en': nameEn,
            'code': code,
            'type': type,
            'screen_width': screenWidth.toString(),
            'screen_height': screenHeight.toString(),
            'rotate_angle': rotateAngle,
          });
      print(
          'auth : ${AuthBody.positionsBodyMap(xpoint: xpoint ?? '', ypoint: ypoint ?? '', floor: floor ?? '', nameEn: nameEn ?? '', code: code ?? '', type: type ?? '', rotateAngle: rotateAngle ?? 0)}');

      await EasyLoading.dismiss();

      return _responseResult2(response, context, lang);
    } catch (e) {
      await EasyLoading.dismiss();
      log('$e in insert position func');
      return false;
    }
  }

  // POST ROUTES DATA
  static Future<bool> insertRoutesFunc(BuildContext context,
      {dynamic xpoint,
      dynamic ypoint,
      dynamic lineId,
      dynamic screenWidth,
      dynamic screenHeight}) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    // try {
    await EasyLoading.show(status: tr('loading'));
    final http.Response response = await http.post(
      Uri.parse('https://alrashid.hwzn.sa/api/routes'
          //'https://maps.abou7agar.me/api/routes'
          ),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        "x_point": xpoint.toString(),
        "y_point": ypoint.toString(),
        "line_id": lineId.toString(),
        "screen_width": screenWidth.toString(),
        "screen_height": screenHeight.toString()
      },
    );
    print(
        'auth : ${AuthBody.routesBodyMap(xpoint: xpoint ?? '', ypoint: ypoint ?? '', lineId: lineId)}');

    await EasyLoading.dismiss();

    return _responseResult2(response, context, lang);
    //}
    // catch (e) {
    //   await EasyLoading.dismiss();
    //   log('$e in routes func');
    //   return false;
    // }
  }

  ///ADD LINE
  static Future<LinesModel> addLineFunc(
    BuildContext context, {
    dynamic isIntersection,
    String? name,
    dynamic floor,
  }) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    // try {
    await EasyLoading.show(status: tr('loading'));
    final http.Response response = await http.post(
      Uri.parse('https://alrashid.hwzn.sa/api/lines'
          //'https://maps.abou7agar.me/api/lines'
          ),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        "is_intersection": isIntersection.toString(),
        "name": name.toString(),
        "floor": floor.toString(),
      },
    );
    print(
        'addLine body map: ${AuthBody.addLineBodyMap(isIntersection: isIntersection ?? '', name: name ?? '', floor: floor ?? 0)}');

    await EasyLoading.dismiss();

    return LinesModel.fromJson(json.decode(response.body)['data']);
    //}
    // catch (e) {
    //   await EasyLoading.dismiss();
    //   log('$e in routes func');
    //   return false;
    // }
  }

  static Future<bool> _responseResult2(
    http.Response response,
    BuildContext context,
    lang,
  ) async {
    log(response.body);

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
