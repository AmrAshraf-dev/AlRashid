part of 'privacy_imports.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _AboutState();
}

class _AboutState extends State<Privacy> {
  PrivacyData aboutData = PrivacyData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var setting = context.read<SettingCubit>().state.model;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    return Scaffold(
        appBar: BuildAuthAppBar(
          title:tr("privacy"),
          isCenterTitle: false,
          haveLeading: true
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          children: [
            MyText(title: lang=="ar"?setting?.privacy ?? "":setting?.privacy_en??"", color: MyColors.black, size: 15)
          ],
        ));
  }
}
