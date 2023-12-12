import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/features/establishment/features/entry_logs/screens/entry_logs.dart';
import 'package:bt_frontend/features/establishment/providers/est_profile.provider.dart';
import 'package:bt_frontend/features/establishment/services/profile.services.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

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

  Map userData = {};
  bool loading = false;

  List recentLogs = [];

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

        tourists = res['data']['data']['tourists'];

        if (tourists.isNotEmpty) {
          for (int i = 2; i >= 0; i--) {
            recentLogs.add(Logs(
                name: tourists[i],
                date: '${res['data']['data']['date'][i]}T00:00:00',
                time: '2023-11-23T${res['data']['data']['time'][i]}'));
          }
        }

        context
            .read<EstablishmentProfileProvider>()
            .setHomeData(data: userData);

        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getEstablishmentHome();
  }

  @override
  Widget build(BuildContext context) {
    var estProvider =
        Provider.of<EstablishmentProfileProvider>(context, listen: true);

    return Scaffold(
        appBar: appBar(title: 'Home'),
        backgroundColor: Colors.white,
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40.0,
                      ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 75,
                              backgroundImage: NetworkImage(
                                  '${estProvider.estHomeData['photo_url']}'),
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${estProvider.estHomeData['name']}'
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    '${estProvider.estHomeData['address_1'] ?? ''}, ${estProvider.estHomeData['barangay']}, ${estProvider.estHomeData['city_municipality']}',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 65, 65, 65),
                                        fontSize: 16.0),
                                  ),
                                  Text(
                                    'Camiguin'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .70,
                                  height: 256.0,
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, // Set the background color
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set the radius
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 2, // Spread radius
                                        blurRadius: 5, // Blur radius
                                        offset: const Offset(0,
                                            3), // Offset (horizontal, vertical)
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .70,
                                        height: 45.0,
                                        decoration:
                                            appColors.btnLinearGradient(),
                                        child: const Center(
                                            child: Text(
                                          'Recent Logs',
                                          style: TextStyle(
                                              color: Colors.white,
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 20.0),
                                        )),
                                      ),
                                      recentLogs.isNotEmpty
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: recentLogs.map((log) {
                                                  return Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${log.name}'
                                                                .toUpperCase(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 18.0),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 6.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Time: ${DateFormat('h:mm a').format(DateTime.parse(log.time))}',
                                                            style:
                                                                dateTimeStyle,
                                                          ),
                                                          Text(
                                                            'Date: ${DateFormat('yMMMd').format(DateTime.parse(log.date))}',
                                                            style:
                                                                dateTimeStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      const Divider(
                                                        thickness: 1.0,
                                                      )
                                                    ],
                                                  );
                                                }).toList(),
                                              ),
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 70.0),
                                              child: Text('No logs available.'),
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: appColors.btnLinearGradient(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    height: 35.0,
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              CupertinoPageRoute(
                                            builder: (context) {
                                              return const BTEntryLogs();
                                            },
                                          ));
                                        },
                                        child: const Text(
                                          'View All',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0),
                                        )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ));
  }
}
