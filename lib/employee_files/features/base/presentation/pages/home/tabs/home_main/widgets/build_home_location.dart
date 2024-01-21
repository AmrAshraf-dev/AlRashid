part of'home_main_widgets_imports.dart';
class BuildHomeLocation extends StatelessWidget {
  const BuildHomeLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var place = context.watch<UserCubit>().state.model?.token?.place!;
    var location = lang=="ar"? context.watch<UserCubit>().state.model?.token?.place?.name_ar??"":context.watch<UserCubit>().state.model?.token?.place?.name_en??"";
    return Row(
      children: [
        Container(
            padding:const EdgeInsets.all(3),
            margin:
            const EdgeInsets.symmetric(vertical: 10, ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: MyColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              size: 20,
              color: MyColors.black,
            )),
        const SizedBox(
          width: 10
        ),
        MyText(
            title: "$location  ,  ${tr("Alrashid")} ",
            color: MyColors.black,
            size: 12)
      ],
    );
  }
}
