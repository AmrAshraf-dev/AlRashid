part of 'employee_details_widgets_imports.dart';

class BuildNationality extends StatelessWidget {
  final EmployeeModel employeeModel;
  const BuildNationality({Key? key, required this.employeeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyText(title: tr("id"), color: MyColors.black, size: 13),
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
              width: 150,
              height: 150,
              borderRadius: BorderRadius.circular(5),
            )),
      ],
    );
  }
}
