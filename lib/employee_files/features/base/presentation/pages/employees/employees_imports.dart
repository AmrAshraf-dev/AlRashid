import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/employees/tap/my_employee/my_employee_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/employees/tap/orders/orders_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

import '../../../../../core/helpers/custom_toast.dart';
import '../../../../auth/presentation/widgets/build_auth_app_bar.dart';
import '../../../data/models/employee/employee_model.dart';

import '../../../domain/use_cases/accept_employee.dart';
import '../../../domain/use_cases/delete_employee.dart';
import '../../../domain/use_cases/get_employee.dart';
import '../../../domain/use_cases/refuse_employee.dart';
import 'widgets/employees_widgets_imports.dart';

part 'employees.dart';
part 'employees_data.dart';