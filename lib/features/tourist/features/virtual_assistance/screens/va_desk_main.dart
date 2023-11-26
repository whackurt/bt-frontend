import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/essential_providers.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/tourist_spots.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/widgets/hotlines.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:bt_frontend/widgets/custom_buttons/white_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BTVADeskMain extends StatefulWidget {
  const BTVADeskMain({super.key});

  @override
  State<BTVADeskMain> createState() => _BTVADeskMainState();
}

class _BTVADeskMainState extends State<BTVADeskMain> {
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Virtual Assistance Desk'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Spread of the shadow
                              offset: Offset(
                                  0, 3), // Offset in the X and Y direction
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.blue, Colors.indigo])),
                      height: 150.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: () {
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return const BTTouristSpots();
                                  }));
                                },
                                child: const Text(
                                  'View Tourist Spots',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 5, // Spread of the shadow
                              offset: Offset(
                                  0, 3), // Offset in the X and Y direction
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 231, 236, 240),
                                Color.fromARGB(255, 248, 249, 255)
                              ])),
                      height: 150.0,
                      width: 150.0,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: () {
                                  Navigator.push(context,
                                      CupertinoPageRoute(builder: (context) {
                                    return const BTEssentialProviders();
                                  }));
                                },
                                child: Text(
                                  'View Essential Providers',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [appText.boldHeader(text: 'Travel Schedules')],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                BTWhiteBtnWithBorder(
                  height: 45.0,
                  labelText: 'Flight Schedules',
                  action: () {},
                ),
                const SizedBox(
                  height: 10.0,
                ),
                BTWhiteBtnWithBorder(
                  height: 45.0,
                  labelText: 'Barge Schedules',
                  action: () {},
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: [
                    appText.boldHeader(text: 'Emergency Hotline Numbers'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const BTEmergencyHotline(
                      agency: 'DRRM Operation Center',
                      imgUrl: 'assets/images/hotlines/drrm.png',
                      location: 'Mambajao, Camiguin',
                      contactno: '0912 345 6789',
                    ),
                    const BTEmergencyHotline(
                      agency: 'Camiguin PPO',
                      imgUrl: 'assets/images/hotlines/camppo.png',
                      location: 'Balbagon, Mambajao',
                      contactno: '0936 897 3287',
                    ),
                    const BTEmergencyHotline(
                      agency: 'BFP',
                      imgUrl: 'assets/images/hotlines/bfp.png',
                      location: 'Balbagon, Mambajao',
                      contactno: '0905 783 1265',
                    ),
                    const BTEmergencyHotline(
                      agency: 'Phil. Coast Guard',
                      imgUrl: 'assets/images/hotlines/coastguard.png',
                      location: 'Benoni, Mahinog',
                      contactno: '0912 345 6789',
                    ),
                    const BTEmergencyHotline(
                      agency: 'Phil. Port Authority',
                      imgUrl: 'assets/images/hotlines/ppa.png',
                      location: 'Balbagon, Mambajao',
                      contactno: '0912 345 6789',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
