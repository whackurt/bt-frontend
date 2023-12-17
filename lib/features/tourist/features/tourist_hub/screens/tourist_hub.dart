import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/essential_providers.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/tourist_spots.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/essential_provider_card.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/hotlines.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/tourist_spot_card.dart';
import 'package:bt_frontend/widgets/custom_buttons/white_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BTTouristHub extends StatefulWidget {
  const BTTouristHub({super.key});

  @override
  State<BTTouristHub> createState() => _BTTouristHubState();
}

class _BTTouristHubState extends State<BTTouristHub> {
  AppText appText = AppText();

  List<Widget> touristSpots = [
    const BTTouristSpotCard(
      touristSpotName: 'White Island',
      imgUrl:
          'https://www.jonnymelon.com/wp-content/uploads/2019/10/white-island-camiguin-12.jpg',
      location: 'Yumbing, Mambajao',
      description:
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    ),
    const BTTouristSpotCard(
      touristSpotName: 'Mantigue Island',
      imgUrl:
          'https://www.balaisabaibai.com/wp-content/uploads/2022/10/Mantigue-7-1000-630.jpg',
      location: 'San Roque, Mahinog',
      description:
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    ),
    const BTTouristSpotCard(
      touristSpotName: 'Sto. Nino Cold Spring',
      imgUrl:
          'https://i0.wp.com/shellwanders.com/wp-content/uploads/2018/11/STO-NI%C3%B1O-COLD-SPRING.jpg?fit=860%2C570&ssl=1',
      location: 'Sto. Nino, Catarman',
      description:
          'The island can be accessed from Barangay Agoho or Brgy. Yumbing in Mambajao about 4 to 6 kilometres (2.5 to 3.7 mi) west of the poblacion or town center. ',
    ),
  ];

  List<Widget> essentialProviders = [
    const BTEssentialProviderCard(
      name: "Landbank ATM",
      location: "Placido Reyes St., Mambajao",
    ),
    const BTEssentialProviderCard(
      name: "11/7 Convenience Store",
      location: "Yumbing, Mambajao",
    ),
    const BTEssentialProviderCard(
      name: "Mercury Drugs",
      location: "Poblacion, Mambajao",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(title: 'Tourist Hub'),
      backgroundColor: PropValues().main,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    AppText().purpleBoldHeader(text: 'Tourist Hub'),
                  ],
                ),
                Row(
                  children: [
                    AppText().subHeader(
                      context: context,
                      text: 'Explore, Plan, and Stay Secure',
                    ),
                  ],
                ),
                const Divider(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText.darkHeading(text: 'Tourist Spots'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                              builder: (context) {
                                        return const BTTouristSpots();
                                      }));
                                    },
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'View More ',
                                          style: TextStyle(
                                              color: Colors.indigo,
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 14.0),
                                        ),
                                        Divider(),
                                        FaIcon(
                                          FontAwesomeIcons.arrowRight,
                                          size: 14,
                                          color: Colors.indigo,
                                        )
                                      ],
                                    )),
                              ),
                              const Divider(),
                            ],
                          ),
                        ],
                      ),
                      CarouselSlider(
                          items: touristSpots,
                          options: CarouselOptions(
                            height: 188,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: true,
                            autoPlay: false,
                            scrollDirection: Axis.horizontal,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          appText.darkHeading(text: 'Essential Providers'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          CupertinoPageRoute(
                                              builder: (context) {
                                        return const BTEssentialProviders();
                                      }));
                                    },
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'View More ',
                                          style: TextStyle(
                                              color: Colors.indigo,
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 14.0),
                                        ),
                                        Divider(),
                                        FaIcon(
                                          FontAwesomeIcons.arrowRight,
                                          size: 14,
                                          color: Colors.indigo,
                                        )
                                      ],
                                    )),
                              ),
                              const Divider(),
                            ],
                          ),
                        ],
                      ),
                      CarouselSlider(
                          items: essentialProviders,
                          options: CarouselOptions(
                            height: 80,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: true,
                            autoPlay: false,
                            scrollDirection: Axis.horizontal,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    appText.darkHeading(text: 'Travel Schedules'),
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
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: [
                    appText.darkHeading(text: 'Emergency Hotline Numbers'),
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
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
