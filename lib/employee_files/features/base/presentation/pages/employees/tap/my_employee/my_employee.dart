part of'my_employee_imports.dart';

class MyEmployee extends StatefulWidget {
  final List<EmployeeModel>employees;
  final EmployeesData employeesData;
  const MyEmployee({Key? key, required this.employees, required this.employeesData}) : super(key: key);

  @override
  State<MyEmployee> createState() => _MyEmployeeState();
}

class _MyEmployeeState extends State<MyEmployee> {
  MyEmployeeData myEmployeeData = MyEmployeeData();

  @override
  Widget build(BuildContext context) {
    print("=======>> ${widget.employees}");
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: widget.employees.length,
        itemBuilder: (context, index) {
          if(widget.employees.isNotEmpty){
            return BuildEmployeeItem(employeeModel: widget.employees[index], employeesData: widget.employeesData, index: index,);
          }else{
            return Center(child:MyText(title:"No Employees Found!", color: MyColors.blackOpacity, size: 14));
          }
        });
  }
}
