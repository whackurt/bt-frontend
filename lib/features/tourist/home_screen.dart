import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/profile/controllers/tourist_profile.controller.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_profile.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  @override
  Widget build(BuildContext context) {
    var touristProvider =
        Provider.of<TouristProfileProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .15,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.indigo]),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Expanded(
                  child: loading
                      ? const SpinKitRing(
                          color: Colors.white,
                          lineWidth: 3,
                          size: 30.0,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  '${touristProvider.touristHomeData['photo_url']}'),
                              backgroundColor:
                                  const Color.fromARGB(255, 131, 73, 73),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, ${touristProvider.touristHomeData['full_name']}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  'Welcome to Bantay Turista!',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 232, 232, 232),
                                      fontSize: 15.0),
                                ),
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * .85,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Image(
                        width: 120.0,
                        height: 120.0,
                        image: AssetImage('assets/images/app-icon.png'),
                      ),
                      Text('Bantay Turista: Your Travel Companion',
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 15.0)),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text('Navigate, Engage, and Explore!',
                          style: TextStyle(
                              color: Colors.indigo[600],
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0)),
                    ],
                  ),
                  const Divider(),
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
                              borderRadius: BorderRadius.circular(
                                  PropValues().borderRadius), // Set the radius
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
                              loading
                                  ? const SpinKitRing(
                                      color: Colors.indigo,
                                      lineWidth: 3,
                                      size: 30.0,
                                    )
                                  : QrImageView(
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
                    height: 10.0,
                  ),
                  const Divider(),
                  // Text(
                  //   'My Address',
                  //   style: TextStyle(color: Colors.grey[900], fontSize: 14.0),
                  // ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromARGB(255, 245, 245, 245),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    // width: MediaQuery.of(context).size.width * .55,
                    child: loading
                        ? const SpinKitRing(
                            color: Colors.indigo,
                            lineWidth: 3,
                            size: 30.0,
                          )
                        : Column(
                            children: [
                              Text(
                                '${touristProvider.touristHomeData['address_1']}, ${touristProvider.touristHomeData['city_municipality']}, ${touristProvider.touristHomeData['state_province']}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 97, 97, 97),
                                    fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '${touristProvider.touristHomeData['country']}'
                                    .toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
