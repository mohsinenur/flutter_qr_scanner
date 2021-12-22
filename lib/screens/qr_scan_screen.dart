import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/screens/result_screen.dart';
import 'package:flutter_qr_scanner/screens/web_view_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:validators/validators.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({Key? key}) : super(key: key);

  @override
  _QRScanScreenState createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  bool isBarCodeRead = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: buildQRView(context),
        ),
      );

  Widget buildQRView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderWidth: 10,
          borderRadius: 5,
          borderLength: 25,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) async {
      if (isBarCodeRead) {
        return;
      }
      isBarCodeRead = true;

      // bool _validURL = Uri.parse(barcode.code.toString()).isAbsolute;
      if (isURL(barcode.code.toString())) {
        await Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => WebViewScreen(
              result: barcode.code.toString(),
            ),
          ),
        );
      } else {
        await Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ResultScreen(
              result: barcode.code.toString(),
            ),
          ),
        );
      }

      isBarCodeRead = false;
    });
  }
}
