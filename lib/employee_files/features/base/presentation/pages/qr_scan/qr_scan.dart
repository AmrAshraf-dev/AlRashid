part of 'qr_scan_imports.dart';

class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {

  QrScanData qrScanData = QrScanData();
  @override
  void reassemble() {
    if (Platform.isAndroid) {
      qrScanData.controller!.resumeCamera();
    } else if (Platform.isIOS) {
      qrScanData.controller!.resumeCamera();
    }
    super.reassemble();
  }

  @override
  void initState() {
    qrScanData.idDoneBLoc.onUpdateData(true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: qrScanData.idDoneBLoc,
      builder: (context, state) {
        return OverlayTooltipScaffold(
          overlayColor: Colors.black38,
          tooltipAnimationCurve: Curves.easeIn,
          tooltipAnimationDuration: const Duration(milliseconds: 500),
          controller: qrScanData.toolTipController,
          startWhen: (initializedWidgetLength) async {
            await Future.delayed(const Duration(milliseconds: 500));
            return initializedWidgetLength == 1 && !state.data;
          },
          builder: (context) => Scaffold(body: Column(children: <Widget>[
            Expanded(flex: 6, child: buildQrView(context)),
            SizedBox(
              height: MediaQuery.of(context).size.height * .18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (qrScanData.result != null)
                  MyText(
                        title: tr("Successes"),
                        color: MyColors.successColor,
                        fontWeight: FontWeight.bold,
                        size: 13),
                  InkWell(
                    onTap: () async => await qrScanData.controller?.resumeCamera(),
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: MyColors.primary)),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: MyColors.primary,
                          size: 30,
                        )),
                  ),
                ],
              ),
            )
          ])),
        );
      },
    );
  }

  void _onQRViewCreated(QRViewController controller){
    qrScanData.controller = controller;
    controller.scannedDataStream.listen((scanData){
      qrScanData.result = scanData;
      qrScanData.idDoneBLoc.onUpdateData(qrScanData.idDoneBLoc.state.data);
        print("=======>> qrScanData.result  ${qrScanData.result}");
        if (qrScanData.result != null) {
          Map code = json.decode(qrScanData.result!.code!);
          print("=======>> code $code");
            qrScanData.scanCode(context ,code["userId"], code["code"]);
          qrScanData.check = false;
          controller.dispose();
          return;
        }
    });

  }

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 450.0;
    return QRView(
      key: qrScanData.qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: MyColors.primary,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 5,
          cutOutSize: scanArea),
      // onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('no Permission')));
    }
  }

  @override
  void dispose() {
    qrScanData.controller?.dispose();
    qrScanData.controller?.stopCamera();
    qrScanData.controller?.pauseCamera();
    qrScanData.toolTipController.dispose();
    super.dispose();
  }
}


