import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/settings/settings_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/domain/use_cases/get_settings.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/home/tabs/home_main/home_main_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/home/tabs/my_profile/my_profile_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/qr_scan/widgets/qr_scan_widgets_imports.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/manager/setting_cubit/setting_cubit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../core/helpers/di.dart';
import '../../../../../core/helpers/utilities.dart';
import '../../../../../core/routes/router_imports.gr.dart';
import '../../../../../res.dart';
import '../../../../auth/presentation/manager/user_cubit/user_cubit.dart';
import '../../../../general/domain/entities/location_entity.dart';
import '../../../../general/presentation/pages/location_address/location_cubit/location_cubit.dart';
import 'widgets/home_widgets_imports.dart';

part 'home.dart';
part 'home_controller.dart';