class ConfirmPriceParams{
  bool? amount;
  int? invoice_id;

  ConfirmPriceParams({this.amount,this.invoice_id});
  Map<String,dynamic>toJson()=>{
    "amount":amount,
    "invoice_id":invoice_id,

  };
}