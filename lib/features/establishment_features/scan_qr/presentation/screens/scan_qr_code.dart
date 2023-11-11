import 'dart:io';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BTScanQR extends StatefulWidget {
  const BTScanQR({super.key});
  @override
  State<BTScanQR> createState() => _BTScanQRState();
}

class _BTScanQRState extends State<BTScanQR> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

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
        appBar: appBar(title: 'Scan QR Code'),
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(bottom: 10, child: buildResult()),
            Positioned(top: 10, child: buildControlButtons())
          ],
        ),
      ));

  Widget buildControlButtons() => Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                icon: FutureBuilder(
                    future: controller?.getFlashStatus(),
                    builder: ((context, snapshot) {
                      if (snapshot.data != null) {
                        return Icon(
                            snapshot.data! ? Icons.flash_on : Icons.flash_off);
                      } else {
                        return Container();
                      }
                    })),
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                }),
            IconButton(
                icon: FutureBuilder(
                    future: controller?.getCameraInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return const Icon(Icons.switch_camera);
                      } else {
                        return Container();
                      }
                    }),
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                })
          ],
        ),
      );

  Widget buildResult() => Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 20.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: barcode != null ? Colors.white : Colors.white24,
          ),
          child: Text(
            barcode != null
                ? 'Result: ${barcode!.code}'
                : 'Place a code in the frame',
            maxLines: 3,
          ),
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: barcode != null
              ? const Color.fromARGB(255, 40, 48, 168)
              : const Color.fromARGB(255, 200, 100, 100),
          borderRadius: 15.0,
          borderLength: 20.0,
          borderWidth: 10.0,
          cutOutSize: MediaQuery.of(context).size.width * 0.7,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
