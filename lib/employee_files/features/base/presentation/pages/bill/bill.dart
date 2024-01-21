part of 'bill_imports.dart';

class Bill extends StatefulWidget {
  final ScanModel model;
  const Bill({Key? key, required this.model}) : super(key: key);

  @override
  State<Bill> createState() => _PillState();
}

class _PillState extends State<Bill> {
  BillData pillData = BillData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
          appBar: const BuildPillAppBar(),
          body: BuildPillBody(pillData: pillData,model: widget.model)),
    );
  }
}
