part of 'terms_imports.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  final TermsData termsData = TermsData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var setting = context.read<SettingCubit>().state.model;
    var lang = context.read<LangCubit>().state.locale.languageCode;

    return Scaffold(
      appBar: BuildAuthAppBar(title: tr("terms"),isCenterTitle: false,haveLeading: true,),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        children: [
          MyText(
              title: lang=="ar"?setting?.terms??"":setting?.terms_en??"",
              color: MyColors.black,
              size: 15)
        ],
      ));

  }
}
