import 'dart:developer';
import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/Views/onBoarding/onBoarding1.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataInLocal {
  static String? userName;
  static Future<void> saveInLocal(
      {required String key,
      required String value,
      required String nameKey,
      required String? nameVal}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    prefs.setString(nameKey, nameVal ?? "0");
    log('value was stored , value $value');
    log('value was stored , value $nameVal');
  }

  // static Future<String> readTokenFromLocal({required bool isRefToken}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String value =
  //       prefs.getString(isRefToken ? "ref_token" : 'access_token') ?? '0';
  //   log('reading from local , token is : $value ');
  //   return value;
  // }

  // static Future<String> readValueFromLocal(String key) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String value = prefs.getString(key) ?? '0';
  //   log('reading from local , value is : $value ');
  //   return value;
  // }

  // static Future<void> readNameFromLocal() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? value = prefs.getString("name");
  //   log('reading from local , value is : $value ');
  //   userName = value;
  // }

  static Future<void> useValueToNavigate(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    const String key = 'access_token';
    final String value = prefs.getString(key) ?? '0';

    if (value != '0') {
      GlobalState.instance.set('token', value);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (c) => // const
                  MyBottomNavyBar(
                    token: value,
                    commingFromSplash: true,
                  )),
          (route) => false);
      log('token in database : $value');
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (c) => // const
                  const OnBoarding1()),
          (route) => false);
      log("No token stored");
      return;
    }
  }

  static Future<bool> clearShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool clear = await prefs.clear();
    clear ? log('shared cleard') : log("err while clearing");
    return clear;
  }
}

//String? eventid;
