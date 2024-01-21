part of'employee_details_widgets_imports.dart';
class BuildEmployeeImage extends StatelessWidget {
  final EmployeeModel employeeModel;
  const BuildEmployeeImage({Key? key, required this.employeeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
              decoration: BoxDecoration(
                color: MyColors.offWhite,
                  border: Border.all(color: MyColors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: CachedImage(
                fit: BoxFit.cover,
                url:
                employeeModel.identity_image??"",
                width: 50,
                height: 50,
                borderRadius: BorderRadius.circular(5),
              )),
          const SizedBox(
            height: 10,
          ),
          MyText(title: employeeModel.name??"", color: MyColors.black, size: 13),
        ],
      ),
    );
  }
}
