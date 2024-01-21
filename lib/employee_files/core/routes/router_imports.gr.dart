// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/active_account/active_account_imports.dart'
    as _i10;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/forget_password/forget_password_imports.dart'
    as _i9;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/login/login_imports.dart'
    as _i8;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/register/register_imports.dart'
    as _i13;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/reset_password/reset_password_imports.dart'
    as _i11;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/select_user/select_user_imports.dart'
    as _i7;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/splash/splash_imports.dart'
    as _i6;
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/verify_code/verify_code_imports.dart'
    as _i12;
import 'package:alrashid_mall_app/employee_files/features/base/data/models/employee/employee_model.dart'
    as _i24;
import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart'
    as _i25;
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/bill/bill_imports.dart'
    as _i20;
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/emolyee_details/employee_details_imports.dart'
    as _i18;
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/employees/employees_imports.dart'
    as _i17;
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/home/home_imports.dart'
    as _i15;
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/product_value/product_value_imports.dart'
    as _i19;
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/profile/profile_imports.dart'
    as _i16;
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/qr_scan/qr_scan_imports.dart'
    as _i21;
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/about/about_imports.dart'
    as _i2;
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/location_address/LocationAddressImports.dart'
    as _i5;
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/privacy/privacy_imports.dart'
    as _i3;
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/repeated_questions/repeated_questions_imports.dart'
    as _i4;
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/terms/terms_imports.dart'
    as _i1;
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/welcome_page/WelcomePageImports.dart'
    as _i14;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    TermsRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Terms());
    },
    AboutRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.About());
    },
    PrivacyRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.Privacy());
    },
    RepeatedQuestionsRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.RepeatedQuestions());
    },
    LocationAddressRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.LocationAddress());
    },
    SplashRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.Splash());
    },
    SelectUserRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.SelectUser());
    },
    LoginRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.Login());
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.ForgetPassword());
    },
    ActiveAccountRoute.name: (routeData) {
      final args = routeData.argsAs<ActiveAccountRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.ActiveAccount(
              key: args.key, email: args.email, code: args.code));
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.ResetPassword(
              key: args.key, email: args.email, code: args.code));
    },
    VerifyCodeRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyCodeRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i12.VerifyCode(key: args.key, email: args.email));
    },
    RegisterRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.Register());
    },
    WelcomePageRoute.name: (routeData) {
      return _i22.CustomPage<dynamic>(
          routeData: routeData,
          child: _i14.WelcomePage(),
          transitionsBuilder: _i22.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i15.Home());
    },
    ProfileRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i16.Profile());
    },
    EmployeesRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.Employees());
    },
    EmployeeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeDetailsRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i18.EmployeeDetails(
              key: args.key,
              employeeModel: args.employeeModel,
              employeesData: args.employeesData));
    },
    ProductValueRoute.name: (routeData) {
      final args = routeData.argsAs<ProductValueRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i19.ProductValue(key: args.key, model: args.model));
    },
    BillRoute.name: (routeData) {
      final args = routeData.argsAs<BillRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i20.Bill(key: args.key, model: args.model));
    },
    QrScanRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i21.QrScan());
    }
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(TermsRoute.name, path: '/Terms'),
        _i22.RouteConfig(AboutRoute.name, path: '/About'),
        _i22.RouteConfig(PrivacyRoute.name, path: '/Privacy'),
        _i22.RouteConfig(RepeatedQuestionsRoute.name,
            path: '/repeated-questions'),
        _i22.RouteConfig(LocationAddressRoute.name, path: '/location-address'),
        _i22.RouteConfig(SplashRoute.name, path: '/'),
        _i22.RouteConfig(SelectUserRoute.name, path: '/select-user'),
        _i22.RouteConfig(LoginRoute.name, path: '/Login'),
        _i22.RouteConfig(ForgetPasswordRoute.name, path: '/forget-password'),
        _i22.RouteConfig(ActiveAccountRoute.name, path: '/active-account'),
        _i22.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i22.RouteConfig(VerifyCodeRoute.name, path: '/verify-code'),
        _i22.RouteConfig(RegisterRoute.name, path: '/Register'),
        _i22.RouteConfig(WelcomePageRoute.name, path: '/welcome-page'),
        _i22.RouteConfig(HomeRoute.name, path: '/'),
        _i22.RouteConfig(ProfileRoute.name, path: '/Profile'),
        _i22.RouteConfig(EmployeesRoute.name, path: '/Employees'),
        _i22.RouteConfig(EmployeeDetailsRoute.name, path: '/employee-details'),
        _i22.RouteConfig(ProductValueRoute.name, path: '/product-value'),
        _i22.RouteConfig(BillRoute.name, path: '/Bill'),
        _i22.RouteConfig(QrScanRoute.name, path: '/qr-scan')
      ];
}

/// generated route for
/// [_i1.Terms]
class TermsRoute extends _i22.PageRouteInfo<void> {
  const TermsRoute() : super(TermsRoute.name, path: '/Terms');

  static const String name = 'TermsRoute';
}

/// generated route for
/// [_i2.About]
class AboutRoute extends _i22.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/About');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i3.Privacy]
class PrivacyRoute extends _i22.PageRouteInfo<void> {
  const PrivacyRoute() : super(PrivacyRoute.name, path: '/Privacy');

  static const String name = 'PrivacyRoute';
}

/// generated route for
/// [_i4.RepeatedQuestions]
class RepeatedQuestionsRoute extends _i22.PageRouteInfo<void> {
  const RepeatedQuestionsRoute()
      : super(RepeatedQuestionsRoute.name, path: '/repeated-questions');

  static const String name = 'RepeatedQuestionsRoute';
}

/// generated route for
/// [_i5.LocationAddress]
class LocationAddressRoute extends _i22.PageRouteInfo<void> {
  const LocationAddressRoute()
      : super(LocationAddressRoute.name, path: '/location-address');

  static const String name = 'LocationAddressRoute';
}

/// generated route for
/// [_i6.Splash]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i7.SelectUser]
class SelectUserRoute extends _i22.PageRouteInfo<void> {
  const SelectUserRoute() : super(SelectUserRoute.name, path: '/select-user');

  static const String name = 'SelectUserRoute';
}

/// generated route for
/// [_i8.Login]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/Login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i9.ForgetPassword]
class ForgetPasswordRoute extends _i22.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(ForgetPasswordRoute.name, path: '/forget-password');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i10.ActiveAccount]
class ActiveAccountRoute extends _i22.PageRouteInfo<ActiveAccountRouteArgs> {
  ActiveAccountRoute(
      {_i23.Key? key, required String email, required String code})
      : super(ActiveAccountRoute.name,
            path: '/active-account',
            args: ActiveAccountRouteArgs(key: key, email: email, code: code));

  static const String name = 'ActiveAccountRoute';
}

class ActiveAccountRouteArgs {
  const ActiveAccountRouteArgs(
      {this.key, required this.email, required this.code});

  final _i23.Key? key;

  final String email;

  final String code;

  @override
  String toString() {
    return 'ActiveAccountRouteArgs{key: $key, email: $email, code: $code}';
  }
}

/// generated route for
/// [_i11.ResetPassword]
class ResetPasswordRoute extends _i22.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute(
      {_i23.Key? key, required String email, required String code})
      : super(ResetPasswordRoute.name,
            path: '/reset-password',
            args: ResetPasswordRouteArgs(key: key, email: email, code: code));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs(
      {this.key, required this.email, required this.code});

  final _i23.Key? key;

  final String email;

  final String code;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, email: $email, code: $code}';
  }
}

/// generated route for
/// [_i12.VerifyCode]
class VerifyCodeRoute extends _i22.PageRouteInfo<VerifyCodeRouteArgs> {
  VerifyCodeRoute({_i23.Key? key, required String email})
      : super(VerifyCodeRoute.name,
            path: '/verify-code',
            args: VerifyCodeRouteArgs(key: key, email: email));

  static const String name = 'VerifyCodeRoute';
}

class VerifyCodeRouteArgs {
  const VerifyCodeRouteArgs({this.key, required this.email});

  final _i23.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyCodeRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i13.Register]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/Register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i14.WelcomePage]
class WelcomePageRoute extends _i22.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(WelcomePageRoute.name, path: '/welcome-page');

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i15.Home]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i16.Profile]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/Profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i17.Employees]
class EmployeesRoute extends _i22.PageRouteInfo<void> {
  const EmployeesRoute() : super(EmployeesRoute.name, path: '/Employees');

  static const String name = 'EmployeesRoute';
}

/// generated route for
/// [_i18.EmployeeDetails]
class EmployeeDetailsRoute
    extends _i22.PageRouteInfo<EmployeeDetailsRouteArgs> {
  EmployeeDetailsRoute(
      {_i23.Key? key,
      required _i24.EmployeeModel employeeModel,
      required _i17.EmployeesData employeesData})
      : super(EmployeeDetailsRoute.name,
            path: '/employee-details',
            args: EmployeeDetailsRouteArgs(
                key: key,
                employeeModel: employeeModel,
                employeesData: employeesData));

  static const String name = 'EmployeeDetailsRoute';
}

class EmployeeDetailsRouteArgs {
  const EmployeeDetailsRouteArgs(
      {this.key, required this.employeeModel, required this.employeesData});

  final _i23.Key? key;

  final _i24.EmployeeModel employeeModel;

  final _i17.EmployeesData employeesData;

  @override
  String toString() {
    return 'EmployeeDetailsRouteArgs{key: $key, employeeModel: $employeeModel, employeesData: $employeesData}';
  }
}

/// generated route for
/// [_i19.ProductValue]
class ProductValueRoute extends _i22.PageRouteInfo<ProductValueRouteArgs> {
  ProductValueRoute({_i23.Key? key, required _i25.ScanModel model})
      : super(ProductValueRoute.name,
            path: '/product-value',
            args: ProductValueRouteArgs(key: key, model: model));

  static const String name = 'ProductValueRoute';
}

class ProductValueRouteArgs {
  const ProductValueRouteArgs({this.key, required this.model});

  final _i23.Key? key;

  final _i25.ScanModel model;

  @override
  String toString() {
    return 'ProductValueRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i20.Bill]
class BillRoute extends _i22.PageRouteInfo<BillRouteArgs> {
  BillRoute({_i23.Key? key, required _i25.ScanModel model})
      : super(BillRoute.name,
            path: '/Bill', args: BillRouteArgs(key: key, model: model));

  static const String name = 'BillRoute';
}

class BillRouteArgs {
  const BillRouteArgs({this.key, required this.model});

  final _i23.Key? key;

  final _i25.ScanModel model;

  @override
  String toString() {
    return 'BillRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i21.QrScan]
class QrScanRoute extends _i22.PageRouteInfo<void> {
  const QrScanRoute() : super(QrScanRoute.name, path: '/qr-scan');

  static const String name = 'QrScanRoute';
}
