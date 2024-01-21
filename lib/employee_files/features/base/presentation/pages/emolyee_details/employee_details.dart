part of 'employee_details_imports.dart';

class EmployeeDetails extends StatefulWidget {
  final EmployeeModel employeeModel;
  final EmployeesData employeesData;

  const EmployeeDetails(
      {Key? key, required this.employeeModel, required this.employeesData})
      : super(key: key);

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  EmployeeDetailsData employeeDetailsData = EmployeeDetailsData();

  @override
  void initState() {
    employeeDetailsData.start = widget.employeeModel.startWork;
    employeeDetailsData.end = widget.employeeModel.endWork;
    employeeDetailsData.getListOfEmployees(context, refresh: false);
    employeeDetailsData.getListOfEmployees(
      context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAuthAppBar(
          haveLeading: true,
          onBack: () {
            if (employeeDetailsData.start != widget.employeeModel.startWork ||
                employeeDetailsData.end != widget.employeeModel.endWork) {
              AutoRouter.of(context).pop(true);
              return;
            }
            AutoRouter.of(context).pop();
          }),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          children: [
            BuildEmployeeImage(employeeModel: widget.employeeModel),
            BuildEmployeeInfo(employeeModel: widget.employeeModel, employeeDetailsData: employeeDetailsData),
            BuildNationality(employeeModel: widget.employeeModel),
            BuildEmployeeButton(employeeDetailsData: employeeDetailsData, employeeModel: widget.employeeModel)
          ]),
    );
  }
}
