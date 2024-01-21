import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/verify_code_params.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/use_case/set_forget_password.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/use_case/set_reset_passeord_by_code.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_auth_app_bar.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_header_logo.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_pin_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../widgets/build_header_title.dart';
import 'widgets/verify_code_widgets_imports.dart';

part 'verify_code.dart';
part 'verify_code_data.dart';