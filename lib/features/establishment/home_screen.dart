import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/controllers/log.controller.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/screens/entry_logs.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/screens/widgets/entry_log_card.dart';
import 'package:bt_frontend/features/establishment/providers/entry_logs.provider.dart';
import 'package:bt_frontend/features/establishment/providers/est_profile.provider.dart';
import 'package:bt_frontend/features/establishment/services/profile.services.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logs {
  String name;
  String time;
  String date;
  Logs({required this.name, required this.time, required this.date});
}

class BTEstHome extends StatefulWidget {
  const BTEstHome({super.key});

  @override
  State<BTEstHome> createState() => _BTEstHomeState();
}

class _BTEstHomeState extends State<BTEstHome> {
  AppColors appColors = AppColors();
  EntryLogsController entryLogsController = EntryLogsController();

  Map userData = {};
  bool loading = false;

  List recentLogs = [];
  List logsToday = [];

  List tourists = [];

  TextStyle dateTimeStyle = TextStyle(color: Colors.grey[700]);

  Future getEstablishmentHome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    await EstablishmentProfileServices()
        .getEstablishmentHomeData(id: pref.getInt('establishmentId').toString())
        .then((res) {
      setState(() {
        userData = res['data']['data']['establishment'];

        context
            .read<EstablishmentProfileProvider>()
            .setHomeData(data: userData);

        loading = false;
      });
    });
  }

  Future getEntryLogsToday() async {
    await entryLogsController.getEntryLogsToday().then((res) {
      if (res['success']) {
        setState(() {
          logsToday = res['data']['logs'];
        });

        context
            .read<EntryLogsProvider>()
            .setEntryLogs(data: res['data']['logs']);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getEstablishmentHome();
    getEntryLogsToday();
  }

  @override
  Widget build(BuildContext context) {
    var estProvider =
        Provider.of<EstablishmentProfileProvider>(context, listen: true);

    var logProvider = Provider.of<EntryLogsProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  // physics: const FixedExtentScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    '${estProvider.estHomeData['photo_url']}'),
                                backgroundColor: Colors.white,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              loading
                                  ? const SpinKitRing(
                                      color: Colors.indigo,
                                      lineWidth: 3,
                                      size: 30.0,
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hi, ${estProvider.estHomeData['name']}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Text(
                                          'Welcome to Bantay Turista!',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 232, 232, 232),
                                              fontSize: 15.0),
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                      ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: loading
                                  ? const SpinKitRing(
                                      color: Colors.indigo,
                                      lineWidth: 3,
                                      size: 30.0,
                                    )
                                  : Column(
                                      children: [
                                        const SizedBox(height: 15.0),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: const Color.fromARGB(
                                                255, 245, 245, 245),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${estProvider.estHomeData['address_1'] ?? ''} ${estProvider.estHomeData['barangay']}, ${estProvider.estHomeData['city_municipality']}',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 97, 97, 97),
                                                    fontSize: 16.0),
                                              ),
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                'Camiguin'.toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.indigo,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            const Image(
                              width: 120.0,
                              height: 120.0,
                              image: AssetImage('assets/images/app-icon.png'),
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText()
                                    .darkHeading(text: 'Today\'s Entry Logs'),
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
                                              return const BTEntryLogs();
                                            }));
                                          },
                                          child: const Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'View More',
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
                            const Divider(),
                            loading
                                ? const SpinKitRing(
                                    color: Colors.indigo,
                                    lineWidth: 3,
                                    size: 30.0,
                                  )
                                : logsToday.isEmpty
                                    ? Text(
                                        'No logs available',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.red[400]),
                                      )
                                    : Column(
                                        children:
                                            logProvider.entryLogsToday.length >
                                                    5
                                                ? logProvider.entryLogsToday
                                                    .take(5)
                                                    .map((log) {
                                                    return BTEntryLogCard(
                                                        entryLog: log);
                                                  }).toList()
                                                : logProvider.entryLogsToday
                                                    .map((log) {
                                                    return BTEntryLogCard(
                                                        entryLog: log);
                                                  }).toList(),
                                      ),
                            const SizedBox(height: 15.0),
                          ],
                        ),
                      )),
                    ],
                  ),
                )),
    );
  }
}
