part of 'bill_imports.dart';

class Bill extends StatefulWidget {
  const Bill({Key? key}) : super(key: key);

  @override
  State<Bill> createState() => _PillState();
}

class _PillState extends State<Bill> {
  BillData pillData = BillData();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
          appBar: const BuildPillAppBar(),
          body: BuildPillBody(pillData: pillData))
    );
  }
}
