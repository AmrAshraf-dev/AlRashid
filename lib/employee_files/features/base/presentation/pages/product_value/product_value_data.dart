part of 'product_value_imports.dart';

class ProductValueData {
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GenericBloc<String> refreshBloc = GenericBloc("");
  void confirmPrice(
    bool amount,
    int invoiceId
  ) async {
    var context = getIt<GlobalContext>().context();
    var params = ConfirmPriceParams(amount: amount, invoice_id: invoiceId);
    var result = await SetConfirmPrice().call(params);
    if (result != null && amount == true) {
      getIt<Utilities>().getCameraPermission();
      AutoRouter.of(context).push(BillRoute(model: result));
    } else if(amount==false){
      CustomToast.showSnakeBar("المبلغ غير صحيح");
      AutoRouter.of(context).push(const HomeRoute());
    }
  }
}
