import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/validator.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/pages/register/register_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/place_item/place_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/Inputs/DropdownTextField.dart';
import 'package:tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:tf_custom_widgets/widgets/LoadingButton.dart';
import 'package:tf_custom_widgets/widgets/MyText.dart';

import '../../../../../../res.dart';

part 'build_have_account.dart';
part 'build_register_button.dart';
part 'build_register_fields.dart';
part 'build_terms_and_policy.dart';
part "build_upload_image.dart";
