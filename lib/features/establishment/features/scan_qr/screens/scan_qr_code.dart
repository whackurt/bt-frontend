import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BTScanQR extends StatefulWidget {
  const BTScanQR({super.key});

  @override
  State<BTScanQR> createState() => _BTScanQRState();
}

class _BTScanQRState extends State<BTScanQR> {
  String _scanBarcode = 'No Scanned QR Code';

  Future<void> scanQR() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // ignore: avoid_print
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: 'Scan QR Code'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              const CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                    'https://imageio.forbes.com/specials-images/imageserve/614898161330562654811729/BVLGARI--Serpenti-Seduttori--Launch--Photocall/0x0.jpg?format=jpg&crop=2398,1599,x0,y92,safe&width=960'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text('Lalisa Manobal',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800])),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 270.0,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Column(
                  children: [
                    Text(_scanBarcode,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo)),
                    _scanBarcode == 'No Scanned QR Code'
                        ? const Text('')
                        : QrImageView(
                            data: _scanBarcode,
                            version: QrVersions.auto,
                            size: 200,
                            errorStateBuilder: (ctx, err) {
                              return const Center(
                                child: Text(
                                  'Something went wrong!!!',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              BTFullWidthButton(
                onPressed: () => scanQR(),
                child: const Text(
                  'Scan QR Code',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
