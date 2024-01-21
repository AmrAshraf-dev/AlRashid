//import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/active_account/active_account_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/reset_password/reset_password_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/verify_code/verify_code_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/welcome_page/WelcomePageImports.dart';
import 'package:auto_route/auto_route.dart';
import '../../pages/forget_password/forget_password_imports.dart';
import '../../pages/login/login_imports.dart';
import '../../pages/register/register_imports.dart';
import '../../pages/select_user/select_user_imports.dart';
import '../../pages/splash/splash_imports.dart';

const List<AutoRoute> authRoute = [
  AdaptiveRoute(page: Splash, initial: true),
  AdaptiveRoute(page: SelectUser),
  AdaptiveRoute(page: Login),
  AdaptiveRoute(page: ForgetPassword),
  AdaptiveRoute(page: ActiveAccount),
  AdaptiveRoute(page: ResetPassword),
  AdaptiveRoute(page: VerifyCode),
  AdaptiveRoute(page: Register),
  CustomRoute(
      page: WelcomePage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 1000),
];
