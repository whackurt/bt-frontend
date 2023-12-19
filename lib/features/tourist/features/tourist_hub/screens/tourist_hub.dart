import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/essential_providers.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/tourist_spots.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/essential_provider_card.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/hotlines.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/widgets/tourist_spot_card.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/tourist_hub.controller.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_hub.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/white_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BTTouristHub extends StatefulWidget {
  const BTTouristHub({super.key});

  @override
  State<BTTouristHub> createState() => _BTTouristHubState();
}

class _BTTouristHubState extends State<BTTouristHub> {
  AppText appText = AppText();
  TouristHubController touristhubController = TouristHubController();

  Future getTouristSpots() async {
    await touristhubController.getTouristSpots().then((res) {
      context
          .read<TouristHubProvider>()
          .setTouristSpots(data: res['data']['tourist_spots']);
    });
  }

  Future getEssentialProviders() async {
    await touristhubController.getEssentialServiceProviders().then((res) {
      // print(res['data']['providers']);
      context
          .read<TouristHubProvider>()
          .setEssentialServiceProviders(data: res['data']['providers']);
    });
  }

  Future getHotlines() async {
    await touristhubController.getEmergencyHotlineNumbers().then((res) {
      context
          .read<TouristHubProvider>()
          .setHotlines(data: res['data']['hotlines']);
    });
  }

  Future getSchedules() async {
    await touristhubController.getSchedules().then((res) {
      // print(res);
      context
          .read<TouristHubProvider>()
          .setSchedules(data: res['data']['schedules']);
    });
  }

  @override
  void initState() {
    super.initState();
    getTouristSpots();
    getEssentialProviders();
    getHotlines();
    getSchedules();
  }

  @override
  Widget build(BuildContext context) {
    var touristHubProvider =
        Provider.of<TouristHubProvider>(context, listen: true);

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
                          items: touristHubProvider.touristSpots
                              .map((spot) => BTTouristSpotCard(
                                    touristSpot: spot,
                                  ))
                              .toList(),
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
                          items: touristHubProvider.essentialServiceProviders
                              .map((prov) => BTEssentialProviderCard(
                                    provider: prov,
                                  ))
                              .toList(),
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
                      url: touristHubProvider.schedules.isNotEmpty
                          ? touristHubProvider.schedules
                              .where((sched) => sched['type'] == "Flight")
                              .toList()[0]['scheduleUrl']
                          : '',
                      height: 45.0,
                      labelText: 'Flight Schedule',
                      iconData: FluentIcons.airplane_take_off_20_regular,
                      action: () {},
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    BTWhiteBtnWithBorder(
                      url: touristHubProvider.schedules.isNotEmpty
                          ? touristHubProvider.schedules
                              .where((sched) => sched['type'] == "Ferry")
                              .toList()[0]['scheduleUrl']
                          : '',
                      height: 45.0,
                      labelText: 'Ferry Schedule',
                      iconData: FluentIcons.vehicle_ship_16_regular,
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
                    Column(
                      children: touristHubProvider.hotlines
                          .map(
                            (hotline) => BTEmergencyHotline(
                              agency: '${hotline['agencyName']}',
                              imgUrl: '${hotline['agencyLogo']}',
                              location: '${hotline['address']}',
                              contactno: '${hotline['hotlineNumber']}',
                            ),
                          )
                          .toList(),
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
