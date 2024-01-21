import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/err_message_model.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:alrashid_mall_app/utils/translation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';

class ERRController {
  Future<bool> errMessageFunc(
      BuildContext context, http.Response response, lang) async {
    ErrMessageModel errMessageModel = errMessageModelFromJson(response.body);
    if (lang == 'en') {
      final String errEN = await GoogleTranslation().translateFromARtoEN(
          sentance: /*'خطأ'*/ errMessageModel.messageAr ?? 'خطأ');
      showDialogOperation(
        "${tr('Error')} - ${response.statusCode}",
        errEN,
        context,
        //      onCancelButtonPressed: () async {
        //   await sendingERRToServer(
        //       token: AuthController.authModel.accessToken ?? '0',
        //       endPoint: response.request!.url.path,
        //       body: response.body,
        //       locale: locale);
        // }
      );
      return false;
    } else {
      showDialogOperation(
        "${tr('Error')} - ${response.statusCode}",
        errMessageModel.messageAr!,
        context,
        //onCancelButtonPressed: () async {
        //   await sendingERRToServer(
        //       token: AuthController.authModel.accessToken ?? '0',
        //       endPoint: response.request!.url.path,
        //       body: response.body,
        //       locale: locale);
        // }
      );
      return false;
    }
  }

  // Future<bool> sendingERRToServer(
  //     {required String token,
  //     required String endPoint,
  //     required String body,
  //     required AppLocalizations? locale}) async {
  //   late final http.Response response;
  //   await EasyLoading.show(status: locale?.waiting);
  //   try {
  //     response = await http.post(Uri.parse(EndPointsUrls.errorURL),
  //         headers: EndPointHeaders.onlyContentTypeMap,
  //         body: json.encode(ErrBody.errContent(
  //             body: body, token: token, endpoint: endPoint)));
  //     if (kDebugMode) {
  //       print("ERR Res : ${response.statusCode}");
  //       print("ERR Res : ${response.body}");
  //     }
  //   } catch (e) {
  //     await EasyLoading.dismiss();
  //     await EasyLoading.showError(locale?.noReply ?? "");
  //     return false;
  //   }
  //   await EasyLoading.dismiss();
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     await EasyLoading.showSuccess(locale?.thanksForProblem ?? "");
  //     return false;
  //   }
  //   await EasyLoading.dismiss();
  //   await EasyLoading.showError(locale?.noReply ?? "");
  //   return false;
  // }

  static Future exitFromAppWhileUnExpectedErr() async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      FlutterError.dumpErrorToConsole(details);
      return _exitFromApp();
    };
  }

  static Future _exitFromApp() async {
    if (Platform.isIOS) {
      if (kReleaseMode) return exit(0);
      //  if (kDebugMode) exit(0);
    } else {
      if (kReleaseMode) return await SystemNavigator.pop();
      //  if (kDebugMode) SystemNavigator.pop();
    }
  }

  static Future<void> initSentry() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://855567d482094fd5849f3a86921758a7@o1210741.ingest.sentry.io/6346555';
        options.tracesSampleRate = 1.0;
      },
    );
  }

  static Future<void> sentryErrCapture(exception, {stackTrace}) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  }
}
