part of 'employees_imports.dart';

class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  EmployeesData employeesData = EmployeesData();

  @override
  void initState() {
    employeesData.getListOfEmployees(context, refresh: false);
    employeesData.getListOfEmployees(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: MyColors.white,
            appBar: BuildAuthAppBar(
                title: tr("employees"),
                isCenterTitle: false,
                haveLeading: true),
            body: BlocBuilder<GenericBloc<List<EmployeeModel>>,
                    GenericState<List<EmployeeModel>>>(
                bloc: employeesData.employeeCubit,
                builder: (context, state) {
                  if (state is GenericUpdateState) {
                    return Column(children: [
                      const BuildTapBar(),
                      Flexible(
                          child: TabBarView(children: [
                        Orders(
                            employees: state.data
                                .where((element) => element.active == "0")
                                .toList(),
                            employeesData: employeesData),
                        MyEmployee(
                            employees: state.data
                                .where((element) => element.active == "1")
                                .toList(),
                            employeesData: employeesData),
                      ]))
                    ]);
                  } else {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                })));
  }
}
