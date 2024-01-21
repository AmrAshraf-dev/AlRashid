import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/helpers/global_state.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/core/models/user_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/login/login_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/data_source/models/login/token_model.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/domain/use_case/get_places.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_auth_app_bar.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/place_item/place_item.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/profile/widgets/profile_widgets_imports.dart';
//import 'package:alrashid_mall_app/utils/textfield_search_label.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';

import '../../../../../core/helpers/adaptive_picker.dart';
import '../../../../../core/helpers/custom_toast.dart';
import '../../../../../core/helpers/di.dart';
import '../../../../../core/helpers/utilities.dart';
import '../../../../auth/data_source/models/place/place_model.dart';
import '../../../../auth/domain/entities/update_profile_params.dart';
//import '../../../../auth/domain/use_case/get_places.dart';
import '../../../../auth/domain/use_case/update_profile.dart';
import '../../../../auth/presentation/manager/user_cubit/user_cubit.dart';

part 'profile.dart';
part 'profile_controller.dart';