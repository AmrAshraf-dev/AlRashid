import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/utilities.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/register/widgets/register_widgets_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_auth_app_bar.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_header_logo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../core/helpers/adaptive_picker.dart';
import '../../../../base/data/models/place_item/place_item.dart';
import '../../../domain/entities/register_params.dart';
import '../../../domain/use_case/get_places.dart';
import '../../../domain/use_case/set_register.dart';
import '../../widgets/build_header_title.dart';

part 'register.dart';
part 'register_data.dart';