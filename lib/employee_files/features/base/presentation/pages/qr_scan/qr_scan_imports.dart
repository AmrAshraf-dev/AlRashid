import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

import '../../../../../core/constants/my_colors.dart';
import '../../../domain/entites/scan_code_params.dart';
import '../../../domain/use_cases/set_scan_code.dart';

part 'qr_scan.dart';
part 'qr_scan_data.dart';