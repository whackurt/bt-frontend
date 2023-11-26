import 'package:bt_frontend/features/tourist/features/feedback_complaints/screens/feedback_complaints.dart';
import 'package:bt_frontend/features/tourist/home_screen.dart';
import 'package:bt_frontend/features/tourist/features/profile/screens/tourist_profile.dart';
import 'package:bt_frontend/features/tourist/features/virtual_assistance/screens/va_desk_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            border: const Border(
                top: BorderSide(color: Color.fromARGB(255, 196, 196, 196))),
            activeColor: Colors.indigo,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Home',
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Assistance',
                activeIcon: Icon(Icons.map),
                icon: Icon(
                  Icons.map_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Feedback',
                activeIcon: Icon(Icons.comment),
                icon: Icon(
                  Icons.comment_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                activeIcon: Icon(Icons.person_2),
                icon: Icon(
                  Icons.person_2_outlined,
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
