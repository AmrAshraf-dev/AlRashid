part of 'employees_imports.dart';

class EmployeesData {
  GenericBloc<List<EmployeeModel>> employeeCubit = GenericBloc([]);

  Future<bool> deleteEmployee(int employeeId, {bool check = false}) async {
    var delete = await DeleteEmployee().call(employeeId);
    if (delete) {
      employeeCubit.state.data.removeWhere((element) => element.id == employeeId);
      employeeCubit.onUpdateData(employeeCubit.state.data);
      CustomToast.showSimpleToast(msg: check ? tr("employeeRejected") : tr("employeeDeleted"), type: ToastType.success);
    }
    return true;
  }

  Future<void> getListOfEmployees(BuildContext context, {bool refresh = true}) async {
    var result = await GetEmployee().call(refresh);
    employeeCubit.onUpdateData(result);
  }

  Future<void> acceptEmployee(int employeeId) async {
    var context = getIt<GlobalContext>().context();
    var accept = await AcceptEmployee().call(employeeId);
    if (accept==true) {
      employeeCubit.state.data.singleWhere((element) => element.id == employeeId).active = "1";
      employeeCubit.onUpdateData(employeeCubit.state.data);
      CustomToast.showSimpleToast(msg: tr("employmentApproved"), type: ToastType.success);
    }
  }

  Future<void> refuseEmployee(int employeeId) async {
    var refuse = await RefuseEmployee().call(employeeId);
    if (refuse==true) {
      CustomToast.showSimpleToast(msg: tr("jobAppRejected"), type: ToastType.success);
    }
  }
}
