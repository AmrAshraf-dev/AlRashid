part of 'my_employee_widgets_imports.dart';

class BuildEmployeeItem extends StatelessWidget {
  final EmployeeModel employeeModel;
  final EmployeesData employeesData;
  final int index;
  const BuildEmployeeItem({Key? key, required this.employeeModel, required this.employeesData, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      closedElevation: 0,
      onClosed: (v){
        if(v!=null){
          employeesData.getListOfEmployees(context);
        }
      },
      transitionDuration: const Duration(milliseconds: 300),
      openBuilder: (_, closeContainer) => EmployeeDetails(employeeModel: employeeModel, employeesData: employeesData,),
      closedBuilder: (_, openContainer) => Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                          decoration: BoxDecoration(
                              border: Border.all(color: MyColors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: CachedImage(
                            fit: BoxFit.cover,
                            url:
                            employeeModel.identity_image??"",
                            width: 50,
                            height: 50,
                            borderRadius: BorderRadius.circular(5),
                          )),
                      const SizedBox(
                        width: 20
                      ),
                      MyText(
                          title: employeeModel.name??"",
                          color: MyColors.black,
                          size: 12),
                    ],
                  ),
                  InkWell(
                    onTap: ()=>employeesData.deleteEmployee(employeeModel.id!),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 22,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: tr("workHours"),
                        color: MyColors.blackOpacity,
                        size: 11),
                    const Spacer(),
                    MyText(
                        title: "${employeeModel.endWork} - ",
                        color: MyColors.black,
                        size: 12),
                    MyText(
                        title: "${employeeModel.startWork} ",
                        color: MyColors.black,
                        size: 12),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
