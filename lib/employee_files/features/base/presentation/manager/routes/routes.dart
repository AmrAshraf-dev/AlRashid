import 'package:alrashid_mall_app/Views/UI/bill/bill_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/home/home_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/qr_scan/qr_scan_imports.dart';
import 'package:auto_route/auto_route.dart';
import '../../pages/emolyee_details/employee_details_imports.dart';
import '../../pages/employees/employees_imports.dart';
import '../../pages/product_value/product_value_imports.dart';
import '../../pages/profile/profile_imports.dart';

const List<AutoRoute> baseRoute = [
  AdaptiveRoute(page: Home, initial: true),
  AdaptiveRoute(page: Profile),
  AdaptiveRoute(page: Employees),
  AdaptiveRoute(page: EmployeeDetails),
  AdaptiveRoute(page: ProductValue),
  AdaptiveRoute(page: Bill),
  AdaptiveRoute(page: QrScan),
];
