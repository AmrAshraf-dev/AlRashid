import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/user_cubit/user_cubit.dart';
import 'package:alrashid_mall_app/employee_files/features/general/presentation/manager/setting_cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/general/presentation/pages/location_address/location_cubit/location_cubit.dart';

class GeneralProviders {
  GeneralProviders._();

  static GeneralProviders instance = GeneralProviders._();

  List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AuthCubit>(create: (BuildContext context) => AuthCubit()),
        BlocProvider<LangCubit>(create: (BuildContext context) => LangCubit()),
        BlocProvider<UserCubit>(create: (BuildContext context) => UserCubit()),
        BlocProvider<LocationCubit>(create: (BuildContext context) => LocationCubit()),
        BlocProvider<SettingCubit>(create: (BuildContext context) => SettingCubit()),
        
      ];
}
