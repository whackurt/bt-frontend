import 'package:bt_frontend/core/constants/decoration/prop_values.dart';
import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/feedback_complaints.dart';
import 'package:bt_frontend/features/tourist/home_screen.dart';
import 'package:bt_frontend/features/tourist/features/profile/screens/tourist_profile.dart';
import 'package:bt_frontend/features/tourist/features/tourist_hub/screens/tourist_hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

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
                activeIcon: Icon(
                  FluentIcons.home_12_filled,
                  size: 23.0,
                ),
                icon: Icon(
                  FluentIcons.home_12_regular,
                  size: 23.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Tourist Hub',
                activeIcon: Icon(
                  FluentIcons.map_16_filled,
                  size: 23.0,
                ),
                icon: Icon(
                  FluentIcons.map_16_regular,
                  size: 23.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Feedback',
                activeIcon: Icon(
                  FluentIcons.chat_12_filled,
                  size: 23.0,
                ),
                icon: Icon(
                  FluentIcons.chat_12_regular,
                  size: 23.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                activeIcon: Icon(
                  FluentIcons.person_12_filled,
                  size: 23.0,
                ),
                icon: Icon(
                  FluentIcons.person_12_regular,
                  size: 23.0,
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
                  return const CupertinoPageScaffold(child: BTTouristHub());
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
