import 'dart:convert';
import 'dart:developer';

import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_state.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../errors/failures.dart';
import '../../../helpers/custom_toast.dart';

@lazySingleton
class HandleErrors {
  void catchError({Response? response, required Function(dynamic) errorFunc}) {
    if (response == null) {
      log("failed response Check Server");
      CustomToast.showSimpleToast(msg: "Check Server");
    } else {
      log("failed response ${response.statusCode}");
      log("failed response ${response.data}");
      var data = response.data;
      try {
        if (data is String) data = json.decode(response.data);
        String message = "";
        if (response.statusCode != 422) {
          message = errorFunc(data).toString();
        }
        switch (response.statusCode) {
          case 503:
          case 404:
            CustomToast.showSnakeBar(message);
            if (message == "Not Authorized") {
              _tokenExpired();
            }
            break;
          case 500:
            CustomToast.showSnakeBar(message.toString());
            break;
          case 502:
            CustomToast.showSnakeBar("check your request");
            break;
          case 422:
            if (data["errors"] != null) {
              List<dynamic> errors = data["errors"];
              log("response errors $errors");
              List<String> lst =
                  List<String>.from(data["errors"].map((e) => e));
              for (var e in lst) {
                CustomToast.showSnakeBar(e);
              }
            }
            break;
          case 400:
            CustomToast.showSnakeBar(data["messge"]);
            break;
          case 401:
          case 301:
          case 302:
            _tokenExpired();
            break;
        }
      } catch (e) {
        CustomToast.showSnakeBar(e.toString());
      }
    }
  }

  Either<ServerFailure, Response> statusError(
      Response response, Function(dynamic) errorFunc) {
    if (response.data == null) {
      CustomToast.showSnakeBar(response.data["message"].toString());
      return Left(ServerFailure());
    }
    return Right(response);
  }

  void _tokenExpired() async {
    var context = getIt<GlobalContext>().context();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
    GlobalState.instance.set("token", null);
    context.read<AuthCubit>().onUpdateAuth(false);
    AutoRouter.of(context)
        .pushAndPopUntil(const SelectUserRoute(), predicate: (o) => false);
    // Phoenix.rebirth(context);
  }
}
