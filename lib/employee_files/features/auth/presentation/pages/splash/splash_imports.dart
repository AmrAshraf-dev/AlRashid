
import 'dart:convert';

import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/init_custom_packages.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/settings/settings_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/use_cases/get_settings.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/home/home_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/manager/setting_cubit/setting_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/welcome_page/WelcomePageImports.dart';
import 'package:alrashid_mall_app/employee_files/res.dart';
import 'package:alrashid_mall_app/utils/AnimationContainer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/helpers/global_state.dart';
import '../../../../../core/models/user_model.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../../manager/user_cubit/user_cubit.dart';

part 'splash.dart';
part 'splash_controller.dart';