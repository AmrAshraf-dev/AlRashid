import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_context.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/global_notification.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/widgets/build_auth_app_bar.dart';
import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart';
import 'package:alrashid_mall_app/employee_files/features/base/presentation/pages/product_value/widgets/product_value_widgets_imports.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../core/helpers/di.dart';
import '../../../../../core/helpers/utilities.dart';
import '../../../../../core/routes/router_imports.gr.dart';
import '../../../../../res.dart';
import '../../../domain/entites/confirm_price_params.dart';
import '../../../domain/use_cases/set_confirm_price.dart';

part 'product_value.dart';
part 'product_value_data.dart';