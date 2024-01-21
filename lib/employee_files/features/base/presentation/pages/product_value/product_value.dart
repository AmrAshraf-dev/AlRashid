part of 'product_value_imports.dart';

class ProductValue extends StatefulWidget {
  final ScanModel model;
  const ProductValue({Key? key, required this.model}) : super(key: key);

  @override
  State<ProductValue> createState() => _ProductValueState();
}

class _ProductValueState extends State<ProductValue> {
  ProductValueData productValueData = ProductValueData();

  @override
  void initState() {
    GlobalNotification().notificationSubject.stream.listen((event) {
      if (mounted) {
        productValueData.refreshBloc.onUpdateData(event["amount"]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: BuildAuthAppBar(
            title: tr("purchasesEntered"),
            isCenterTitle: true,
            haveLeading: false),
        body: ListView(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 50),
          children: [
            Image.asset(Res.bags, height: 100, width: 100),
            const BuildProductText(),
            BlocBuilder<GenericBloc<String>, GenericState<String>>(
              bloc: productValueData.refreshBloc,
              builder: (context, state) {
                return BuildPrice(price:state.data);
              },
            ),
            BuildValueButton(productValueData: productValueData, model: widget.model,)
          ],
        ),
      ),
    );
  }
}
