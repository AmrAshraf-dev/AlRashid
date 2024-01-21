part of'orders_widget_imports.dart';
class BuildOrderBody extends StatelessWidget {
  final EmployeeModel employeeModel;
  final EmployeesData employeesData;
  final int index;
  const BuildOrderBody({Key? key, required this.employeeModel, required this.employeesData, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: tr("affiliateBrand"),
                        color: MyColors.grey,
                        size: 12),
                    MyText(
                        title: (lang == "ar" ? employeeModel.place?.place?.name_ar:employeeModel.place?.place?.name_en)??"",
                        color: MyColors.black,
                        size: 12),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: tr("workHours"),
                        color: MyColors.grey,
                        size: 12),
                    const Spacer(),
                    MyText(
                        title: "${employeeModel.endWork} - ",
                        color: MyColors.black,
                        size: 12),
                    MyText(
                        title: "${employeeModel.startWork}",
                        color: MyColors.black,
                        size: 12),

                  ],
                ),
              ],
            ),
          ),
          MyText(
              title: tr("id"),
              color: MyColors.black,
              size: 13),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyColors.grey),
                shape: BoxShape.rectangle,
              ),
              child: CachedImage(
                fit: BoxFit.cover,
                url:
                "https://alrashid.hwzn.sa/public/storage/files/${employeeModel.nationalId}",
                width: 50,
                height: 50,
                borderRadius: BorderRadius.circular(5),
              )),
          BuildOrderButtons(employeeModel: employeeModel, employeesData: employeesData, index: index,)
        ],
      ),
    );
  }
}
