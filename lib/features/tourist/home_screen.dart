import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/features/tourist/features/profile/controllers/tourist_profile.controller.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_profile.provider.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BTTouristHome extends StatefulWidget {
  const BTTouristHome({super.key});
  @override
  State<BTTouristHome> createState() => _BTTouristHomeState();
}

class _BTTouristHomeState extends State<BTTouristHome> {
  AppColors appColors = AppColors();
  TouristProfileController touristProfileController =
      TouristProfileController();

  Map userData = {};
  bool loading = false;

  final GlobalKey _qrkey = GlobalKey();
  bool dirExists = false;
  dynamic externalDir = '/storage/emulated/0/Download/Qr_code';

  Future getTouristHomeData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    await TouristProfileController()
        .getTouristHomeData(id: pref.getInt('touristId').toString())
        .then((res) {
      setState(() {
        userData = res['data']['data'];
        loading = false;
      });

      context.read<TouristProfileProvider>().setTouristHomeData(data: userData);
    });
  }

  @override
  void initState() {
    super.initState();
    getTouristHomeData();
  }

  Future<void> _captureAndSavePng() async {
    try {
      RenderRepaintBoundary boundary =
          _qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      //Drawing White Background because Qr Code is Black
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder,
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
      canvas.drawRect(
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
          whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);
      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      //Check for duplicate file name to avoid Override
      String fileName = '${userData['qr_code']}';
      int i = 1;
      while (await File('$externalDir/$fileName.png').exists()) {
        fileName = '${userData['qr_code']}_$i';
        i++;
      }

      // Check if Directory Path exists or not
      dirExists = await File(externalDir).exists();
      //if not then create the path
      if (!dirExists) {
        await Directory(externalDir).create(recursive: true);
        dirExists = true;
      }

      final file = await File('$externalDir/$fileName.png').create();
      await file.writeAsBytes(pngBytes);

      if (!mounted) return;
      const snackBar = SnackBar(content: Text('QR code saved to gallery'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      if (!mounted) return;
      const snackBar = SnackBar(content: Text('Something went wrong!!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    var touristProvider =
        Provider.of<TouristProfileProvider>(context, listen: true);

    return BTContentWrapper(
      onRefresh: () async {
        getTouristHomeData();
      },
      title: 'Home',
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(
                        '${touristProvider.touristHomeData['photo_url']}'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Text(
                          '${touristProvider.touristHomeData['full_name']}'
                              .toUpperCase(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 29, 29, 29),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '${touristProvider.touristHomeData['address_1']}, ${touristProvider.touristHomeData['city_municipality']}, ${touristProvider.touristHomeData['state_province']}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 65, 65, 65),
                              fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          '${touristProvider.touristHomeData['country']}'
                              .toUpperCase(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 102, 102, 102),
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RepaintBoundary(
                    key: _qrkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            width: 220.0,
                            height: 250.0,
                            decoration: BoxDecoration(
                              color: Colors.white, // Set the background color
                              borderRadius:
                                  BorderRadius.circular(10.0), // Set the radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: const Offset(
                                      0, 3), // Offset (horizontal, vertical)
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 220.0,
                                height: 50.0,
                                decoration: appColors.btnLinearGradient(),
                                child: Center(
                                    child: Text(
                                  '${touristProvider.touristHomeData['qr_code']}'
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 23.0),
                                )),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              QrImageView(
                                data: touristProvider
                                        .touristHomeData['qr_code'] ??
                                    '',
                                version: QrVersions.auto,
                                size: 180,
                                errorStateBuilder: (ctx, err) {
                                  return const Center(
                                    child: Text(
                                      'Something went wrong!!!',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: 220.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(10.0), // Border radius
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 134, 134, 134), // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: TextButton(
                        onPressed: _captureAndSavePng,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Save QR Code',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 134, 134, 134)),
                        )),
                  )
                ],
              ),
      )),
    );
  }
}
