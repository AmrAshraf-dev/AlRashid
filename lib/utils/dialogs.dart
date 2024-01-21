import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showDialogOperation(
    String title, String body, BuildContext context,
    {DialogType dialogType = DialogType.ERROR,
    bool headerAnimationLoop = false,
    String? buttonOkText,
    String? buttonCancelText,
    dynamic Function()? onOkButtonPressed,
    /*required*/ dynamic Function()? onCancelButtonPressed,
    bool dismissOnBackKeyPress = true,
    bool dismissOnTouchOutside = true,
    Color? buttonOkColor,
    Color? buttonCancelColor,
    AnimType animType = AnimType.SCALE}) {
  //var locale = AppLocalizations.of(context);
  return AwesomeDialog(
          btnOkColor: buttonOkColor,
          btnCancelColor: buttonCancelColor,
          dismissOnBackKeyPress: dismissOnBackKeyPress,
          dismissOnTouchOutside: dismissOnTouchOutside,
          context: context,
          dialogType: dialogType,
          title: dialogType == DialogType.ERROR
              ? tr('error') // locale!.error
              : title,
          desc: body,
          headerAnimationLoop: headerAnimationLoop,
          animType: animType,
          btnOkText: buttonOkText ?? tr('Back'), //locale!.back,
          //btnCancelText: buttonCancelText ?? locale!.tellUs,
          btnCancelOnPress: onCancelButtonPressed,
          btnOkOnPress: onOkButtonPressed)
      .show();
}
