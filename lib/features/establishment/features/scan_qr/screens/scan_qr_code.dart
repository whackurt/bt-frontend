import 'package:bot_toast/bot_toast.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/controllers/log.controller.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/models/log.model.dart';
import 'package:bt_frontend/features/establishment/providers/entry_logs.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BTScanQR extends StatefulWidget {
  const BTScanQR({super.key});

  @override
  State<BTScanQR> createState() => _BTScanQRState();
}

class _BTScanQRState extends State<BTScanQR> {
  EntryLogsController entryLogsController = EntryLogsController();

  String qrCodeResult = 'No Scanned QR Code';
  List<dynamic>? logDetails = [];
  bool loading = false;
  bool invalidQrCode = false;

  Future<void> scanQR() async {
    String barcodeScanRes;

    try {
      logDetails = [];
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      qrCodeResult = barcodeScanRes;
    });

    if (qrCodeResult == '-1') {
      BotToast.showText(text: 'No QR code scanned.');
    }

    if (qrCodeResult != '-1') {
      await createLog();
    }
  }

  Future createLog() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
      invalidQrCode = false;
      logDetails = [];
    });

    await entryLogsController
        .createLog(
            log: Log(
                qrCode: qrCodeResult,
                dateTime: DateTime.now(),
                establishmentId: pref.getInt('establishmentId')))
        .then((res) {
      if (res['success']) {
        BotToast.showText(text: 'Entry log recorded successfully.');

        setState(() {
          logDetails = res['data']['log'];
        });
      } else {
        setState(() {
          invalidQrCode = true;
        });
      }
    });

    setState(() {
      loading = false;
    });

    await entryLogsController.getEntryLogsToday().then((res) {
      context.read<EntryLogsProvider>().setEntryLogs(data: res['data']['logs']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.qrcode,
                      size: 30.0,
                      color: Colors.red[400],
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText().purpleBoldHeader(text: 'Scan QR Code'),
                        Text(
                          'Record Tourist Entry',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                logDetails!.isNotEmpty
                    ? CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            '${logDetails![0]['tourist']['photo_url']}'),
                        backgroundColor: Colors.white,
                      )
                    : const SizedBox(
                        height: 150.0,
                      ),
                const SizedBox(
                  height: 30.0,
                ),
                logDetails!.isNotEmpty
                    ? Text(
                        '${logDetails![0]['tourist']['first_name']} ${logDetails![0]['tourist']['last_name']}',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800]))
                    : const SizedBox(
                        height: 30.0,
                      ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 270.0,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: loading
                      ? const SpinKitRing(
                          color: Colors.indigo,
                          lineWidth: 3.0,
                        )
                      : Column(
                          children: [
                            invalidQrCode
                                ? Text('Invalid QR Code',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red[400]))
                                : Text(
                                    qrCodeResult == '-1'
                                        ? 'No QR Code Scanned'
                                        : qrCodeResult,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.indigo)),
                            qrCodeResult == 'No Scanned QR Code' ||
                                    qrCodeResult == '-1'
                                ? const SizedBox(
                                    height: 200.0,
                                    width: 180.0,
                                  )
                                : QrImageView(
                                    data: qrCodeResult,
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
      ),
    );
  }
}
