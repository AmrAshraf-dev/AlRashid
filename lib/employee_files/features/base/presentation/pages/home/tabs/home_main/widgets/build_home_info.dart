part of'home_main_widgets_imports.dart';
class BuildHomeInfo extends StatelessWidget {
  final PlaceModel model;
  const BuildHomeInfo({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var type = context.read<UserCubit>().state.model!.user!.manger;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MyText(
              title: (lang=="ar"? model.place?.name_ar:model.place?.name_en)??"" ,
              color: MyColors.black,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MyText(
                title: "${model.place?.floor??0}",
                color: MyColors.blackOpacity,
                size: 12),
          ),
          if(type==0 || type == "0")
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                    title: tr("workHours"),
                    color: MyColors.blackOpacity,
                    size: 11),
                Row(
                  children: [
                    MyText(
                        title: "${model.endWork??""} - ",
                        color: Colors.red,
                        size: 11),
                    MyText(
                        title: model.startWork??"",
                        color: Colors.red,
                        size: 11),

                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
            child: MyText(
              title: (lang=="ar"? model.place?.name_ar:model.place?.name_en)??"" ,
              color: MyColors.grey,
              size: 13,
              alien: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
