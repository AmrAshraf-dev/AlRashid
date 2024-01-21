import 'dart:io';

import 'package:alrashid_mall_app/employee_files/features/base/data/models/scan/scan_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../core/constants/my_colors.dart';
import '../../../../../core/helpers/di.dart';
import '../../../../../core/helpers/utilities.dart';
import '../../../../../core/localization/localization_methods.dart';
import '../../../../../core/routes/router_imports.gr.dart';
import '../../../domain/entites/invoice_params.dart';
import '../../../domain/use_cases/set_share_invoice.dart';
import 'widgets/pill_widgets_imports.dart';

part 'bill.dart';
part 'bill_data.dart';