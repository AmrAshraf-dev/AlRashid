import 'package:alrashid_mall_app/employee_files/core/helpers/custom_toast.dart';
import 'package:alrashid_mall_app/employee_files/core/helpers/di.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/employee_files/core/routes/router_imports.gr.dart';
import 'package:alrashid_mall_app/employee_files/core/usecases/use_case.dart';
import 'package:alrashid_mall_app/employee_files/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/helpers/global_state.dart';
import '../repositories/repositoris.dart';

class SetLogOut implements UseCase<dynamic, NoParams> {
  final BuildContext context;

  SetLogOut(this.context);

  @override
  Future<dynamic> call(NoParams params) async {
    var result = await getIt<AuthRepository>().logOut(params);
    if (result.isRight()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      context.read<AuthCubit>().onUpdateAuth(false);
      await prefs.remove("user");
      GlobalState.instance.set("token", null);
      CustomToast.showSnakeBar(tr("logoutSuccess"), type: ToastType.success);
      AutoRouter.of(context)
          .pushAndPopUntil(const SelectUserRoute(), predicate: (o) => false);
      return true;
    }
    return false;
  }
}
