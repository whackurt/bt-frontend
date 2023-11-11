import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/features/establishment_features/entry_logs/presentation/screens/entry_logs.dart';
import 'package:bt_frontend/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logs {
  String? name, time, date;
  Logs({this.name, this.time, this.date});
}

class BTEstHome extends StatefulWidget {
  const BTEstHome({super.key});

  @override
  State<BTEstHome> createState() => _BTEstHomeState();
}

class _BTEstHomeState extends State<BTEstHome> {
  AppColors appColors = AppColors();
  bool viewLogs = false;

  Map<String, dynamic> estProfile = {
    'name': "Jonard's Grill",
    'address': 'Bonbon, Camiguin',
  };

  List people = [
    Logs(name: 'Jonard Lambert', time: '10:24', date: '10/24/23'),
    Logs(name: 'Jonard Lambz', time: '10:27', date: '10/24/23'),
    Logs(name: 'Jons the nard', time: '10:30', date: '10/24/23')
  ];

  TextStyle dateTimeStyle = TextStyle(color: Colors.grey[700]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: 'Home'),
        body: Padding(
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
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            'https://cdn.icon-icons.com/icons2/1860/PNG/512/apartment_118092.png'),
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Text(
                              '${estProfile['name']?.toUpperCase()}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              '${estProfile['address']}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .70,
                            height: 256.0,
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
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .70,
                                  height: 45.0,
                                  decoration: appColors.btnLinearGradient(),
                                  child: const Center(
                                      child: Text(
                                    'Recent Logs',
                                    style: TextStyle(
                                        color: Colors.white,
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: people.map((log) {
                                      return Column(
                                        children: [
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${log.name}'.toUpperCase(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18.0),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 6.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Time: ${log.time}',
                                                style: dateTimeStyle,
                                              ),
                                              Text(
                                                'Date: ${log.date}',
                                                style: dateTimeStyle,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              height: 35.0,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, CupertinoPageRoute(
                                      builder: (context) {
                                        return const BTEntryLogs();
                                      },
                                    ));
                                  },
                                  child: const Text(
                                    'View All',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.0),
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
