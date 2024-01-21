import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_auth_app_bar.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/employees/employees_imports.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import '../../../domain/entites/update_employee_profile.dart';
import '../../../../../core/helpers/adaptive_picker.dart';
import '../../../data/models/employee/employee_model.dart';
import '../../../domain/use_cases/delete_employee.dart';
import '../../../domain/use_cases/get_employee.dart';
import '../../../domain/use_cases/update_employee.dart';
import 'widgets/employee_details_widgets_imports.dart';


part 'employee_details.dart';
part 'employee_details_data.dart';