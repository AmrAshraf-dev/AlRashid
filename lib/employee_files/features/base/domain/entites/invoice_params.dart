import 'dart:io';

class InvoiceParams {
  int? invoice_id;
  File? invoice;

  InvoiceParams({this.invoice_id, this.invoice});

  Map<String, dynamic> toJson() => {
        "invoice_id": invoice_id,
        "invoice": invoice,
      };
}
