part of 'about_imports.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  AboutData aboutData = AboutData();

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
            title:tr("about"), isCenterTitle: false, haveLeading: true),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          children: [
            MyText(title: lang=="ar"?setting?.about ?? "":setting?.about_en??"", color: MyColors.black, size: 15)
          ],
        ));
  }
}
