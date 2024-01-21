import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/utilities.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_auth_app_bar.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/employees/employees_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/home/tabs/my_profile/widgets/my_profile_widgets_import.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/profile/profile_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/manager/setting_cubit/setting_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/pages/privacy/privacy_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../../../../../core/localization/localization_methods.dart';
import '../../../../../../../core/usecases/use_case.dart';
import '../../../../../../auth/domain/use_case/set_logOut.dart';
import '../../../../../../auth/presentation/manager/user_cubit/user_cubit.dart';
import '../../../../../../general/presentation/pages/about/about_imports.dart';
import '../../../../../../general/presentation/pages/contact_us/contact_us_imports.dart';
import '../../../../../../general/presentation/pages/terms/terms_imports.dart';
import '../../../../../domain/use_cases/change_language.dart';

part 'my_profile.dart';
part 'my_profile_data.dart';