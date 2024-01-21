part of 'product_value_imports.dart';

class ProductValue extends StatefulWidget {
  const ProductValue({Key? key}) : super(key: key);

  @override
  State<ProductValue> createState() => _ProductValueState();
}

class _ProductValueState extends State<ProductValue> {
  ProductValueData productValueData = ProductValueData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("قيمه المشتريات",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 50),
          children: [
            Image.asset("assets/images/bags.png", height: 100, width: 100),
            const BuildProductText(),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: EntryField(
                keyboardType: const TextInputType.numberWithOptions(),
                isPassword: false,
                lableText: tr('Done'), //locale!.done,
                onChange: (String e) {
                  productValueData.controller.text = e;
                },
                fieldTextEditingController: productValueData.controller,
                validator: (String? val) {
                  return null;
                },
              ),
            ),
            const BuildValueButton()
          ],
        ),
      ),
    );
  }
}
