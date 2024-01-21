import 'package:alrashid_mall_app/Views/Auth/login.dart';
import 'package:alrashid_mall_app/Views/Auth/signup.dart';
import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/Views/UI/splash.dart';
import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/core/models/user_model.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/login/login_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/select_user/select_user_imports.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

part 'Build_select_user_buttons.dart';