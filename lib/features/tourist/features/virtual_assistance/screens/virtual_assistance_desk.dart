import 'package:bt_frontend/core/constants/decoration/app_colors.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/essential_providers.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/tourist_spots.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/va_desk_main.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/models/va_state.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:flutter/material.dart';

class BTVirtualAssistanceDesk extends StatefulWidget {
  const BTVirtualAssistanceDesk({super.key});

  @override
  State<BTVirtualAssistanceDesk> createState() =>
      _BTVirtualAssistanceDeskState();
}

class _BTVirtualAssistanceDeskState extends State<BTVirtualAssistanceDesk> {
  AppColors appColors = AppColors();
  AppText appText = AppText();
  Map hotlines = {};

  var inactiveColor = const Color.fromARGB(255, 128, 128, 128);
  var gradientStyle = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, Colors.indigo]);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: selectedIndex == 0 ? gradientStyle : null,
                    border: Border.all(
                        color: selectedIndex != 0
                            ? inactiveColor
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset:
                            const Offset(0, 3), // Offset (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Text(
                        'VA Desk',
                        style: TextStyle(
                            color: selectedIndex != 0
                                ? inactiveColor
                                : Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                Container(
                  height: 40.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: selectedIndex == 1 ? gradientStyle : null,
                    border: Border.all(
                        color: selectedIndex != 1
                            ? inactiveColor
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset:
                            const Offset(0, 3), // Offset (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Text(
                        'Tourist Spots',
                        style: TextStyle(
                            color: selectedIndex != 1
                                ? inactiveColor
                                : Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                Container(
                  height: 40.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: selectedIndex == 2 ? gradientStyle : null,
                    border: Border.all(
                        color: selectedIndex != 2
                            ? inactiveColor
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 1, // Spread radius
                        blurRadius: 2, // Blur radius
                        offset:
                            const Offset(0, 3), // Offset (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      child: Text(
                        'Essentials',
                        style: TextStyle(
                            color: selectedIndex != 2
                                ? inactiveColor
                                : Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
            IndexedStack(index: selectedIndex, children: const <Widget>[
              BTVADeskMain(),
              BTTouristSpots(),
              BTEssentialProviders()
            ]),
          ],
        ));
  }
}
