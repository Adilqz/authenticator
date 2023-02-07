import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:aspans_authenticator/screens/mainPage.dart';

class qrScanner extends StatefulWidget {
  qrScanner({Key? key}) : super(key: key);

  @override
  _qrScannerState createState() => _qrScannerState();
}

class _qrScannerState extends State<qrScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose;
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQRView(context),
          Positioned(bottom: 10, child: buildResult()),
          Positioned(top: 10, child: buildControlButtons()),
        ],
      )),
    );
  }

  Widget buildResult() => Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24,
        ),
        child: Text(
          barcode != null ? '${barcode!.code}' : 'Scan a code',
          maxLines: 3,
          style: TextStyle(color: Colors.white),
        ),
      );

    Widget buildQRView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).accentColor,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;

      controller.scannedDataStream
          .listen((barcode) => setState(() => this.barcode = barcode));
    });
  }

  Widget buildControlButtons() => Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                        snapshot.data! ? Icons.flash_off : Icons.flash_on,
                        color: Colors.white);
                  } else {
                    return Container();
                  }
                }),
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {});
            },
          ),
          Padding(padding: EdgeInsets.only(left: 10, right: 10)),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: ()  {
              // Navigator.pop(context);
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mainPage()));
            },
          )
        ],
      ));

  
}
