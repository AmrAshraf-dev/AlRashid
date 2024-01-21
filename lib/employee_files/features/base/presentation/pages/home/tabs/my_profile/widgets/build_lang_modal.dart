part of 'my_profile_widgets_import.dart';

class BuildLangModal extends StatelessWidget {
  final MyProfileData myProfileData;

  const BuildLangModal({Key? key, required this.myProfileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return AlertDialog(
            title: MyText(
              title: tr("changeLang"),
              color: MyColors.black,
              size: 14,
              fontWeight: FontWeight.bold,
              alien: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<String>(
                  title: MyText(
                    title: tr("langEn"),
                    size: 14,
                    color: state.locale == "en"
                        ? MyColors.primary
                        : MyColors.black,
                  ),
                  value: "en",
                  groupValue: state.locale.languageCode,
                  onChanged: (v) => myProfileData.changeLanguage("en",context),
                  activeColor: MyColors.primary,
                ),
                RadioListTile<String>(
                  title: MyText(
                    title: tr("langAr"),
                    size: 14,
                    color: state.locale == "ar"
                        ? MyColors.primary
                        : MyColors.black,
                  ),
                  value: "ar",
                  groupValue: state.locale.languageCode,
                  onChanged: (v) => myProfileData.changeLanguage("ar",context),
                  activeColor: MyColors.primary,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
