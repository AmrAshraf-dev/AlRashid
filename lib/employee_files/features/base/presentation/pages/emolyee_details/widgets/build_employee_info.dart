part of 'employee_details_widgets_imports.dart';

class BuildEmployeeInfo extends StatelessWidget {
  final EmployeeModel employeeModel;
  final EmployeeDetailsData employeeDetailsData;

  const BuildEmployeeInfo(
      {Key? key,
      required this.employeeModel,
      required this.employeeDetailsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Padding(
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
              MyText(title: (lang == "ar"? employeeModel.place?.place?.name_ar : employeeModel.place?.place?.name_en) ??"", color: MyColors.black, size: 12),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: employeeDetailsData.refreshCubit,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: tr("workHours"), color: MyColors.grey, size: 12),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 20,
                        color: MyColors.primary,
                      ),
                      const SizedBox(
                        width: 5
                      ),
                      InkWell(
                        onTap: () => employeeDetailsData.onStartTime(context),
                        child: MyText(
                            title: "${employeeDetailsData.start}   - ",
                            color: MyColors.black,
                            size: 12),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 20,
                    color: MyColors.primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => employeeDetailsData.onEndTime(context),
                    child: MyText(
                        title: "  ${employeeDetailsData.end}  ",
                        color: MyColors.black,
                        size: 12),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
