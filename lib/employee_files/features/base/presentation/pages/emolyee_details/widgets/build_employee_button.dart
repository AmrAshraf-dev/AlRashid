part of 'employee_details_widgets_imports.dart';

class BuildEmployeeButton extends StatelessWidget {
  final EmployeeDetailsData employeeDetailsData;
  final EmployeeModel employeeModel;

  const BuildEmployeeButton({Key? key,
    required this.employeeDetailsData,
    required this.employeeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc, GenericState>(
      bloc: employeeDetailsData.refreshCubit,
      builder: (context, state) {
        return Column(
          children: [
            LoadingButton(
                borderRadius: 30,
                borderColor: MyColors.primary,
                title: tr("delete"),
                onTap: () =>
                    employeeDetailsData.deleteEmployee(employeeModel.id!),
                color: MyColors.white,
                textColor: MyColors.primary,
                btnKey: employeeDetailsData.btnKey,
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 90),
                fontSize: 13,
                height: 45),
            employeeDetailsData.start != employeeModel.startWork ||
                employeeDetailsData.end != employeeModel.endWork
                ? LoadingButton(
                borderRadius: 30,
                borderColor: MyColors.primary,
                title: tr("update"),
                onTap: () =>
                    employeeDetailsData.updateEmployee(employeeModel.id!),
                color: MyColors.white,
                textColor: MyColors.primary,
                btnKey: employeeDetailsData.updateBtnKey,
                margin: const EdgeInsets.symmetric(horizontal: 90),
                fontSize: 13,
                height: 45)
                : Container(),
          ],
        );
      },
    );
  }
}
