import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/api/body/auth_body.dart';
import 'package:alrashid_mall_app/api/controllers/err_controller.dart';
import 'package:alrashid_mall_app/api/headers.dart';
import 'package:alrashid_mall_app/database.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/endpoints.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/auth_model.dart';
import 'package:alrashid_mall_app/models/signup_model.dart';
import 'package:alrashid_mall_app/models/user_data_model.dart';
import 'package:alrashid_mall_app/utils/dialogs.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class AuthController {
  static AuthModel authModel = AuthModel();
  static SignUpModel signUpModel = SignUpModel();
  static UserDataModel userDataModel = UserDataModel();
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FacebookAuth _facebookAuth = FacebookAuth.i;

  static Future<bool> loginFunc(BuildContext context,
      {String? phoneNumber, String? password}) async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("================>$token");
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('Login in progress'));

      final http.Response response = await http.post(
          Uri.parse(EndPointsUrls.loginUrl),
          headers: EndPointHeaders.onlyContentTypeMap,
          body: json.encode(AuthBody.signInBodyMap(
              phoneOrEmail: phoneNumber ?? '',
              password: password ?? '',
              firebaseToken: token)));
      await EasyLoading.dismiss();
      return _responseResult(response, context, lang, login: true);
    } catch (e) {
      await EasyLoading.dismiss();
      log('$e in login func');
      return false;
    }
  }

  static Future<bool> signUpFunc(
    BuildContext context, {
    String? phoneNumber,
    String? password,
    String? email,
    String? name,
  }) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;

    try {
      await EasyLoading.show(status: tr('Signup in progress'));
      final http.Response response = await http.post(
          Uri.parse(EndPointsUrls.signUpUrl),
          headers: EndPointHeaders.onlyContentTypeMap,
          body: json.encode(AuthBody.signUpBodyMap(
              phoneNumber: phoneNumber ?? '',
              password: password ?? '',
              email: email ?? '',
              name: name ?? '')));
      await EasyLoading.dismiss();
      return _responseSignUpResult(response, context, lang, signUp: true);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //     onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.signUpUrl,
          //       body: e.toString(),
          //       locale: locale);
          // },
          onOkButtonPressed: () {});
      log('$e in signup func');
      return false;
    }
  }

  ///FACEBOOK LOGIN
  static Future<bool> loginWithFACEBOOK(BuildContext context) async {
    final result =
        await _facebookAuth.login(permissions: ["public_profile", "email"]);
    if (result.status == LoginStatus.success) {
      // LoginManager.getInstance().loginBehavior = LoginBehavior.WEB_ONLY
      final userData = await _facebookAuth.getUserData(fields: "name,email");
      // var locale = AppLocalizations.of(context);
      var lang = context.read<LangCubit>().state.locale.languageCode;
      try {
        await EasyLoading.show(status: tr('Login in progress'));
        final http.Response response = await http.post(
            Uri.parse(EndPointsUrls.socialLoginURL),
            headers: EndPointHeaders.onlyContentTypeMap,
            body: json.encode(AuthBody.socialLoginBody(
                name: userData["email"],
                mail: userData["email"],
                socialProvider: 'facebook')));
        await EasyLoading.dismiss();
        return _responseResult(response, context, lang, login: true);
      } catch (e) {
        await EasyLoading.dismiss();
        showDialogOperation(tr('Error'), e.toString(), context,
            //     onCancelButtonPressed: () async {
            //   await ERRController().sendingERRToServer(
            //       token: AuthController.authModel.accessToken ?? '0',
            //       endPoint: EndPointsUrls.socialLoginURL,
            //       body: e.toString(),
            //       locale: locale);
            // },
            onOkButtonPressed: () {});
        log('$e in loginWithFACEBOOK func');
        return false;
      }
    }
    return false;
  }

  ///GOOGLE LOGIN
  static Future<bool> loginWithGOOGLE(BuildContext context) async {
    final GoogleSignInAccount? _googleAcc = await _googleSignIn.signIn();
    print('gooogleAcccc displayName :: ${_googleAcc?.displayName}');
    print('gooogleAcccc email:: ${_googleAcc?.email}');
    if (_googleAcc == null) {
      return false;
    }
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      print('socail login ]]]]]]');
      print(
          'mybodyy${AuthBody.socialLoginBody(name: _googleAcc.displayName!, mail: _googleAcc.email, socialProvider: 'google')}');
      print('urllll${EndPointsUrls.socialLoginURL}');
      await EasyLoading.show(status: tr('Login in progress'));
      final http.Response response = await http.post(
          Uri.parse(EndPointsUrls.socialLoginURL),
          headers: {}, //EndPointHeaders.onlyContentTypeMap,
          body:
              // AuthBody.socialLoginBody(
              //   name: _googleAcc.displayName,
              //   mail: _googleAcc.email,
              //   socialProvider: 'google')
              //   )
              {
            "name": _googleAcc.displayName,
            "email": _googleAcc.email,
            "source": "google"
          });
      print('response socail login ::$response');
      print(
          'gooogleAcccc displayName after response :: ${_googleAcc.displayName}');
      print('gooogleAcccc email:: after response ${_googleAcc.email}');
      await EasyLoading.dismiss();
      return _responseResult(response, context, lang, login: true);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //     onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.socialLoginURL,
          //       body: e.toString(),
          //       locale: locale);
          // },
          onOkButtonPressed: () {});
      log('$e in loginWithGOOGLE func');
      return false;
    }
  }

  ///apple signIn
  static Future<bool> appleSignIn(BuildContext context) async {
    final AuthorizationCredentialAppleID? credential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    if (credential == null) {
      return false;
    }
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('Login in progress'));
      final http.Response response = await http.post(
          Uri.parse(EndPointsUrls.socialLoginURL),
          headers: {},
          body: json.encode(AuthBody.socialLoginBody(
              token: credential.identityToken,
              name: credential.givenName ?? tr('Nothing'),
              mail: credential.email ?? tr('Nothing'),
              socialProvider: 'apple')));
      await EasyLoading.dismiss();
      return _responseResult(response, context, lang, login: true);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          onCancelButtonPressed: () async {
        //   await ERRController().sendingERRToServer(
        //       token: AuthController.authModel.accessToken ?? '0',
        //       endPoint: EndPointsUrls.socialLoginURL,
        //       body: e.toString(),
        //       locale: locale);
      }, onOkButtonPressed: () {});
      log('$e in appleSignIn func');
      return false;
    }
  }

  static Future<bool> forgetPassFunc(BuildContext context,
      {String? email}) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('loading'));
      final http.Response response = await http.post(
          Uri.parse(EndPointsUrls.forgetPassUrl),
          headers: EndPointHeaders.onlyContentTypeMap,
          body: json.encode(AuthBody.forgetPassAndResendVerfiyForRegBodyMap(
              email: email!.trim())));
      await EasyLoading.dismiss();
      return _responseResult(response, context, lang);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //   onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.forgetPassUrl,
          //       body: e.toString(),
          //       locale: locale);
          //},
          onOkButtonPressed: () {});
      log('$e in forgetPass func');
      return false;
    }
  }

  static Future<bool> verfiyFunc(BuildContext context,
      {required String? otp, required String? email}) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('loading'));
      final http.Response response = await http.post(
          Uri.parse(EndPointsUrls.checkOTPUrl),
          headers: EndPointHeaders.onlyContentTypeMap,
          body: json
              .encode(AuthBody.codeCheckBodyMap(code: otp!, email: email!)));
      await EasyLoading.dismiss();
      return _responseResult(response, context, lang);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //     onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.checkOTPUrl,
          //       body: e.toString(),
          //       locale: locale);
          // },
          onOkButtonPressed: () {});
      log('$e in verfiy func');
      return false;
    }
  }

  // static Future<bool> verfiyForSignUPFunc(BuildContext context,
  //     {required String? otp, required String? email}) async {
  //   var locale = AppLocalizations.of(context);
  //   try {
  //     await EasyLoading.show(status: 'تحميل' /*locale!.loading*/);
  //     final http.Response response = await http.post(
  //         Uri.parse(EndPointsUrls.verifyEmailURL),
  //         headers: EndPointHeaders.onlyContentTypeMap,
  //         body: json.encode(AuthBody.codeCheckBodyMap(
  //             code: otp!.trim(), email: email!.trim())));
  //     await EasyLoading.dismiss();
  //     return _responseResult(response, context, locale);
  //   } catch (e) {
  //     await EasyLoading.dismiss();
  //     showDialogOperation('خطأ', /*locale!.error!,*/ e.toString(), context,
  //         //     onCancelButtonPressed: () async {
  //         //   await ERRController().sendingERRToServer(
  //         //       token: AuthController.authModel.accessToken ?? '0',
  //         //       endPoint: EndPointsUrls.checkOTPUrl,
  //         //       body: e.toString(),
  //         //       locale: locale);
  //         // },
  //         onOkButtonPressed: () {});
  //     log('$e in verfiy func');
  //     return false;
  //   }
  // }

  // static Future<bool> resendOTPFunc(BuildContext context,
  //     {required String? email}) async {
  //   var locale = AppLocalizations.of(context);
  //   try {
  //     await EasyLoading.show(status: 'تحميل' /*locale!.loading*/);
  //     final http.Response response = await http.post(

  //         /// i should use reset-password-request???
  //         Uri.parse(EndPointsUrls.resendOTPURL),
  //         headers: EndPointHeaders.onlyContentTypeMap,
  //         body: json.encode(AuthBody.forgetPassAndResendVerfiyForRegBodyMap(
  //             email: email!.trim())));
  //     await EasyLoading.dismiss();
  //     return _responseResult(response, context, locale);
  //   } catch (e) {
  //     await EasyLoading.dismiss();
  //     showDialogOperation('خطأ', /*locale!.error!,*/ e.toString(), context,
  //         //     onCancelButtonPressed: () async {
  //         //   await ERRController().sendingERRToServer(
  //         //       token: AuthController.authModel.accessToken ?? '0',
  //         //       endPoint: EndPointsUrls.forgetPassUrl,
  //         //       body: e.toString(),
  //         //       locale: locale);
  //         // },
  //         onOkButtonPressed: () {});
  //     log('$e in resendOTPFunc func');
  //     return false;
  //   }
  // }

  static Future<bool> resetPasswordFunc(BuildContext context,
      {required String? otp,
      required String? password,
      required String? confirmPass,
      required String? email}) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('loading'));
      final http.Response response =
          await http.post(Uri.parse(EndPointsUrls.resetPassUrl),
              headers: {}, //EndPointHeaders.onlyContentTypeMap,
              body: json.encode(AuthBody.resetPasswordConfirmBodyMap(
                code: otp!.trim(),
                password: password!.trim(),
                email: email!.trim(),
                confirmpassBody: confirmPass!.trim(),
              )));
      await EasyLoading.dismiss();
      return _responseResult(response, context, lang);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //     onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.resetPassUrl,
          //       body: e.toString(),
          //       locale: locale);
          // },
          onOkButtonPressed: () {});
      log('$e in restPass func');
      return false;
    }
  }

  static Future<bool> updateMyDatafunc(
    BuildContext context, {
    String? token,
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
    String? birthDate,
    String? gender,
    File? identityImage,
  }) async {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('Signup in progress'));
      // print('formm dataaaa00000000 ::::: ');
      FormData formData = FormData.fromMap(AuthBody.userDataBodyMap(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        birthDate: birthDate,
        gender: gender,
        //identityImage: identityImage,
      ));
      // print('formm dataaaa1111 :::::  $formData');
      AuthBody.userDataBodyMap(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        birthDate: birthDate,
        gender: gender,
        identityImage: identityImage,
      ).forEach((key, value) async {
        //   log('valueeeeee ::: 33333333333 $value');
        if ((value) is File) {
          // log('valueeeeee ::: 44444 $value');
          //create multipart using filepath, string or bytes
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(value.path,
                  filename: value.path.split("/").last));
          //add multipart to request
          formData.files.add(pic);
        }

        //  log('formm dataaaa :::::  ${formData.files.first.value.filename}');
        //Response response;
        var dio = Dio();
        dio.options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ${GlobalState.instance.get('token') ?? ''}'
        };
        print(
            'token in header in update profile :: ==>>${GlobalState.instance.get('token')}');
        print(
            'fooooooormmm dataaaaaaaaaa :: ++++>>>${formData.fields.toSet()}');
        var response =
            await dio.post(EndPointsUrls.updateMyDataUrl, data: formData);
        await EasyLoading.dismiss();
        return _responseImageResult(response, context, lang);
      });

      return true;
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //  onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.signUpUrl,
          //       body: e.toString(),
          //       locale: locale);
          //},
          onOkButtonPressed: () {});
      log('$e in updateMyData func');
      return false;
    }
  }

  static Future<bool> contactUsfunc(
    BuildContext context, {
    String? name,
    String? email,
    String? phoneNumber,
    String? yourMessage,
  }) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      await EasyLoading.show(status: tr('Signup in progress'));
      final http.Response response = await http.post(
          Uri.parse(EndPointsUrls.contactUsUrl),
          headers: EndPointHeaders.onlyContentTypeMap,
          body: json.encode(AuthBody.contactUsBodyMap(
              phoneNumber: phoneNumber!,
              yourMessage: yourMessage!,
              email: email!,
              name: name!)));
      await EasyLoading.dismiss();
      return _responseResult(response, context, lang);
    } catch (e) {
      await EasyLoading.dismiss();
      showDialogOperation(tr('Error'), e.toString(), context,
          //     onCancelButtonPressed: () async {
          //   await ERRController().sendingERRToServer(
          //       token: AuthController.authModel.accessToken ?? '0',
          //       endPoint: EndPointsUrls.signUpUrl,
          //       body: e.toString(),
          //       locale: locale);
          // },
          onOkButtonPressed: () {});
      log('$e in updateMyData func');
      return false;
    }
  }

  static Future<bool> getUserData(BuildContext context, String? token) async {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    try {
      final http.Response response = await http.post(
        Uri.parse(EndPointsUrls.userDataUrl),
        headers: token == null || token == '0'
            ? null
            : EndPointHeaders.contentTypeAndTokenMap(
                GlobalState.instance.get('token')),
      );
      print('my response from apiii 900909090 :: $response');
      await EasyLoading.dismiss();
      return _responseUserResult(context, response, '', lang);
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
        print('$e in getUserData func');
      }
      return false;
    }
  }

  static Future<bool> loggingOut(BuildContext context, bool isSocial,
      {String? source}) async {
    if (isSocial) {
      source == 'google' ? _googleSignIn.signOut() : _facebookAuth.logOut();
      return DataInLocal.clearShared();
    }

    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;

    try {
      await EasyLoading.show(status: tr('logout'));
      final http.Response response = await http.post(
        Uri.parse(EndPointsUrls.logoutUrl),
        headers: EndPointHeaders.contentTypeAndTokenMap(
            GlobalState.instance.get('token')),
      );
      print('logout in tokenn : ${GlobalState.instance.get('token')}');

      await EasyLoading.dismiss();
      return _responseResult(response, context, lang);
    } catch (e) {
      await EasyLoading.dismiss();
      // showDialogOperation(locale!.error!, e.toString(), context,
      //     onCancelButtonPressed: () async {
      //   await ERRController().sendingERRToServer(
      //       token: AuthController.authModel.accessToken!,
      //       endPoint: EndPointsUrls.deleteAccount,
      //       body: e.toString(),
      //       locale: locale);
      // }, onOkButtonPressed: () {});
      log('$e in logout func');
      GlobalState.instance.set('token', authModel.accessToken);
      return DataInLocal.clearShared();
    }
    // GlobalState.instance.set('token', null);
    // return DataInLocal.clearShared();
  }

  static Future<bool> _responseUserResult(
      BuildContext context, http.Response response, String model, lang) async {
    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      userDataModel = userDataModelFromJson(response.body);
      print('bodyyyyyyyyyyyyyyyyyyyyyyy${userDataModel.image}');
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
          buttonCancelText: tr('signIn'));
      return false;
    }

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

  ///===========================================================================
  ///===========================================================================
  static Future<bool> _responseResult(
      http.Response response, BuildContext context, locale,
      {bool login = false}) async {
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      login ? await _saveLoginToken(response) : () {};

      return true;
    }
    if (response.statusCode >= 400 && response.statusCode < 500) {
      return ERRController().errMessageFunc(context, response, locale);
    }
    log(response.request!.url.path);
    showDialogOperation(locale?.error! ?? 'خطأ',
        "${response.statusCode}\n${locale?.serverERR ?? "خطأ"}", context,
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

  static Future<dynamic> _responseImageResult(
    Response response,
    BuildContext context,
    locale,
  ) async {
    // log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      //signUp ? await _saveSignUpToken(response) : () {};

      return response;
    }
    // if (response.statusCode >= 400 && response.statusCode < 500) {
    //   return ERRController().errMessageFunc(context, response, locale);
    // }
    // log(response.request!.url.path);
    showDialogOperation(locale?.error! ?? 'خطأ',
        "${response.statusCode}\n${locale?.serverERR ?? "خطأ"}", context,
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

  static Future<bool> _responseSignUpResult(
      http.Response response, BuildContext context, locale,
      {bool signUp = false}) async {
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      signUp ? await _saveSignUpToken(response) : () {};

      return true;
    }
    if (response.statusCode >= 400 && response.statusCode < 500) {
      return ERRController().errMessageFunc(context, response, locale);
    }
    log(response.request!.url.path);
    showDialogOperation(locale?.error! ?? 'خطأ',
        "${response.statusCode}\n${locale?.serverERR ?? "خطأ"}", context,
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

  static Future<void> _saveLoginToken(http.Response response) async {
    authModel = authModelFromJson(response.body);
    print('auth modelll token :${authModel.accessToken}');
    GlobalState.instance.set('token', authModel.accessToken);

    await DataInLocal.saveInLocal(
        key: 'access_token',
        value: authModel.accessToken!,
        nameKey: "name",
        nameVal: authModel.user?.name);
  }

  static Future<void> _saveSignUpToken(http.Response response) async {
    signUpModel = signUpModelFromJson(response.body);
    print('siggGGnnNNUuUUppP modelll token :${signUpModel.accessToken}');
    GlobalState.instance.set('token', signUpModel.accessToken);

    await DataInLocal.saveInLocal(
        key: 'access_token',
        value: signUpModel.accessToken!,
        nameKey: "name",
        nameVal: signUpModel.userSignUp?.name);
  }
}
