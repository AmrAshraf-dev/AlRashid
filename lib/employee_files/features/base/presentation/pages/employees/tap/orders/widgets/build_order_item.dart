part of 'orders_widget_imports.dart';

class BuildOrderItem extends StatelessWidget {
  final List<EmployeeModel> employeeModel;
  final EmployeesData employeesData;

  const BuildOrderItem({Key? key, required this.employeeModel, required this.employeesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 500),
        dividerColor: MyColors.offWhite,
        expansionCallback: (panelIndex, isExpanded) {
          employeeModel[panelIndex].isExpanded =
          !employeeModel[panelIndex].isExpanded;
          employeesData.employeeCubit.onUpdateData(employeesData.employeeCubit.state.data);
        },
        children: List.generate(
          employeeModel.length,
              (index) => ExpansionPanel(
              isExpanded: employeeModel[index].isExpanded,
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2),
                              decoration: BoxDecoration(
                                  color: MyColors.offWhite,
                                  border: Border.all(color: MyColors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: CachedImage(
                                fit: BoxFit.cover,
                                url:employeeModel[index].identity_image??"",
                                width: 50,
                                height: 50,
                                borderRadius: BorderRadius.circular(5),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                              title: employeeModel[index].name ?? "",
                              color: MyColors.black,
                              size: 13),
                        ],
                      ),
                    ),
                  ],
                );
              },
              body: BuildOrderBody(employeeModel: employeeModel[index], employeesData: employeesData, index: index,)
          ),
        ),
      )
    );
  }
}
