import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_state.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/utilities.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/entities/login_params.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../core/localization/localization_methods.dart';
import '../../../domain/use_case/set_user_login.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../../widgets/build_auth_app_bar.dart';
import '../../widgets/build_header_logo.dart';
import 'widgets/login_widgets_imports.dart';

part 'login.dart';
part 'login_data.dart';
