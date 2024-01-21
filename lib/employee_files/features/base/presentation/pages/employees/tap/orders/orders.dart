part of'orders_imports.dart';

class Orders extends StatefulWidget {
  final List<EmployeeModel> employees;
  final EmployeesData employeesData;
  const Orders({Key? key, required this.employees, required this.employeesData}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  OrderData orderData = OrderData();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      child: BuildOrderItem(employeeModel: widget.employees, employeesData: widget.employeesData),
    );
  }
}
