part of'bill_imports.dart';
class BillData{
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  Future<void> onChoosePhoto(BuildContext context,int invoiceId) async {
    var invoice = await getIt<Utilities>().getCameraImage();
    if (invoice != null) {
      shareInvoice(invoice, invoiceId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr("operationCompleted"),
                  color: MyColors.white,
                  size: 13),
              const Icon(Icons.close, color: MyColors.white)
            ],
          )));
      Future.delayed(const Duration(milliseconds: 5000), () {
        AutoRouter.of(context).push(const HomeRoute());
      });
    }
  }
  shareInvoice( File invoice, int invoiceId)async{
    var params = InvoiceParams(
      invoice_id: invoiceId,
      invoice: invoice
    );
    var res = await ShareInvoice().call(params);
    print ("===========invoice $invoice");
    print ("===========invoice $invoiceId");


  }

}