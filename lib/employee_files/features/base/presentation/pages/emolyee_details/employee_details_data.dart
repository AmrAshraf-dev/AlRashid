part of 'employee_details_imports.dart';

class EmployeeDetailsData {
  String? start;
  String? end;


  GenericBloc<List<EmployeeModel>> employeeCubit = GenericBloc([]);

  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GlobalKey<CustomButtonState> updateBtnKey = GlobalKey();
  GenericBloc<bool> refreshCubit = GenericBloc(false);

  Future<void> getListOfEmployees(BuildContext context, {bool refresh = true}) async {
    var result = await GetEmployee().call(refresh);
    employeeCubit.onUpdateData(result);
  }

  Future<bool> updateEmployee(int employeeId,) async {
    var params = UpdateEmployeeParam(employer_id: employeeId, start_work: start, end_work: end);
    var update = await UpdateEmployee().call(params);
    if (update) {
      refreshCubit.onUpdateData(!refreshCubit.state.data);
      CustomToast.showSimpleToast(msg: tr("updateInfoSuccess"), type: ToastType.success);
    }
    return true;
  }

  void onStartTime(BuildContext context) {
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          start = DateFormat("HH:mm ").format(date!);
          refreshCubit.onUpdateData(!refreshCubit.state.data);
        },
        title: '');

  }

  void onEndTime(BuildContext context) {
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          end = DateFormat("HH:mm ").format(date!);
          refreshCubit.onUpdateData(!refreshCubit.state.data);
        },
        title: '');
  }

  Future<bool> deleteEmployee(int employeeId) async {
    var context = getIt<GlobalContext>().context();
    var delete = await DeleteEmployee().call(employeeId);
    if (delete) {
      employeeCubit.state.data.removeWhere((element) => element.id == employeeId);
      employeeCubit.onUpdateData(employeeCubit.state.data);
      AutoRouter.of(context).pop(true);
      CustomToast.showSimpleToast(msg: tr("employeeDeleted"), type: ToastType.error);
    }
    return true;
  }
}
