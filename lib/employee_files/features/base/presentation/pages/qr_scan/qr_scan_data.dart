part of 'qr_scan_imports.dart';

class QrScanData {
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  TooltipController toolTipController = TooltipController();
  GenericBloc<bool> idDoneBLoc = GenericBloc(false);
  bool check = true;

  Future<bool> scanCode(BuildContext context, int user, String code) async {
    if (check==true) {
      var params = ScanCodeParams(user: user, code: code);
      var data = await SetScanCode().call(params);
      controller?.dispose();
      controller?.stopCamera();
      controller?.pauseCamera();

      print("=========>> data?.invoice $data ");
      if (data?.invoice != null) {
        AutoRouter.of(context).push(ProductValueRoute(model: data!));
        check = false;
        return true;
      }
      CustomToast.showSimpleToast(
          msg: "This bar code is invalid", type: ToastType.error);
      AutoRouter.of(context).push(const HomeRoute());
      check = false;
      return false;
    }
    return false;
  }
}
