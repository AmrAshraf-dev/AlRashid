import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/validator.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/place_item/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/Inputs/DropdownTextField.dart';
import 'package:tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:tf_custom_widgets/widgets/CachedImage.dart';
import 'package:tf_custom_widgets/widgets/LoadingButton.dart';

import '../../../../../../core/bloc/lang_cubit/lang_cubit.dart';
import '../profile_imports.dart';

part 'build_profile_button.dart';
part 'build_profile_fields.dart';
part 'build_upload_image.dart';