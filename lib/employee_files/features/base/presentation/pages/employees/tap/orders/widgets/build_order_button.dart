part of'orders_widget_imports.dart';
class BuildOrderButtons extends StatelessWidget {
  final EmployeeModel employeeModel;
  final EmployeesData employeesData;
  final int index;
  const BuildOrderButtons({Key? key, required this.employeeModel, required this.employeesData, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: ()=>employeesData.acceptEmployee(employeeModel.id!),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 25),
              decoration:BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.circular(20),

              ),
              child: MyText(
                title: tr("accept"),
                color: MyColors.white,
                size: 12,
                fontWeight: FontWeight.bold,
                alien: TextAlign.center,
              ),
            ),
          ),

          InkWell(
            onTap: ()=>employeesData.deleteEmployee(employeeModel.id!,check: true),
            child: MyText(
              title: tr("reject"),
              color: MyColors.primary,
              size: 12,
              fontWeight: FontWeight.bold,
              alien: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
