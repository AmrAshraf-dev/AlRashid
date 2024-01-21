import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:alrashid_mall_app/employee_files/core/constants/my_colors.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/utilities.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/features/general/domain/entities/location_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tf_custom_widgets/widgets/MyText.dart';

import 'location_cubit/location_cubit.dart';
import 'widgets/LocationWidgetsImports.dart';

part 'LocationAddress.dart';
part 'LocationAddressData.dart';
