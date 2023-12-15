import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/feedback_complaints.dart';
import 'package:bt_frontend/features/tourist/home_screen.dart';
import 'package:bt_frontend/features/tourist/features/profile/screens/tourist_profile.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/va_desk_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TouristContainer extends StatefulWidget {
  const TouristContainer({super.key});

  @override
  State<TouristContainer> createState() => _TouristContainerState();
}

int selectedIndex = 0;

class _TouristContainerState extends State<TouristContainer> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: PropValues().main,
            border: Border(top: BorderSide(color: PropValues().secondary)),
            activeColor: Colors.indigo,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Home',
                icon: FaIcon(
                  FontAwesomeIcons.house,
                  size: 20.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Tourist Hub',
                icon: FaIcon(
                  FontAwesomeIcons.mapLocation,
                  size: 20.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Feedback',
                icon: FaIcon(
                  FontAwesomeIcons.reply,
                  size: 20.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: FaIcon(
                  FontAwesomeIcons.userLarge,
                  size: 20.0,
                ),
              ),
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: BTTouristHome());
                },
              );

            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: BTVADeskMain());
                },
              );

            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(
                      child: BTFeedbackComplaints());
                },
              );

            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: BTTouristProfile());
                },
              );
          }
          return Container();
        });
  }
}
