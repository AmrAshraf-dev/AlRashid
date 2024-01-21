import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';

extension Validator on String {
  String? noValidate() {
    return null;
  }

  String? validateEmpty({String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("fillField");
    }
    return null;
  }

  String? validateName({String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (length < 3 || length > 30) {
      return message ?? "يجب ان لا يقل عدد الحروف عن ثلاثة أحرف ";
    }
    return null;
  }
  String? validatePhone({String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (length < 10 ) {
      return message ?? " يجب ان لا يقل عدد الحروف عن 10 أحرف وأن يبدأ ب 05  ";
    }else if(!startsWith("05", 0)){
      return message??"يجب أن يبدأ رقم الهاتف ب 05 ";
    }
    else if (length>10 ) {
      return message ?? " يجب ان لا يزيد عدد الحروف عن 10 أحرف وأن يبدأ ب 05 ";
    }
    return null;
  }

  String? validateAddress({String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (length < 3 || length > 100) {
      return message ?? tr("validateName");
    }
    return null;
  }

  String? validatePassword( {String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (!RegExp(
        r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(this)) {
      return message ?? tr( "passValidation");
    }
    return null;
  }

  String? validateEmail({String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this)) {
      return message ?? tr("mailValidation");
    }
    return null;
  }

  String? validateEmailORNull({String? message}) {
    if (trim().isNotEmpty) {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? tr("mailValidation");
      }
    }
    return null;
  }

  // String? validatePhone({String? message}) {
  //   if (trim().isEmpty) {
  //     return message ?? tr("fillField");
  //   } else if (!RegExp(
  //               r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
  //           .hasMatch(this) ||
  //       length < 10) {
  //     return message ?? tr("phoneValidation");
  //   }
  //   return null;
  // }

  String? validatePhoneOrNull({String? message}) {
    if (trim().isEmpty) {
      return null;
    } else if (!RegExp(
                r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
            .hasMatch(this) ||
        length < 10) {
      return message ?? tr("phoneValidation");
    }
    return null;
  }

  String? validatePasswordConfirm({required String pass, String? message}) {
    if (trim().isEmpty) {
      return message ?? tr("fillField");
    } else if (this != pass) {
      return message ?? tr("confirmValidation");
    }
    return null;
  }
}

String? validateDropDown(dynamic model, {String? message}) {
  if (model == null) {
    return message ?? tr("fillField");
  }
  return null;
}
