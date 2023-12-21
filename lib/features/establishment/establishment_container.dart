import 'package:bt_frontend/features/establishment/home_screen.dart';
import 'package:bt_frontend/features/establishment/features/profile/screens/establishment_profile.dart';
import 'package:bt_frontend/features/establishment/features/scan_qr/screens/scan_qr_code.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EstablishmentContainer extends StatefulWidget {
  const EstablishmentContainer({super.key});

  @override
  State<EstablishmentContainer> createState() => _EstablishmentContainerState();
}

int selectedIndex = 0;

class _EstablishmentContainerState extends State<EstablishmentContainer> {
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
                label: 'Scan',
                activeIcon: Icon(
                  FluentIcons.scan_qr_code_24_filled,
                  size: 23.0,
                ),
                icon: Icon(
                  FluentIcons.scan_qr_code_24_regular,
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
              selectedIndex = 0;
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: BTEstHome());
                },
              );

            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: BTScanQR());
                },
              );

            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return const CupertinoPageScaffold(child: BTEstProfile());
                },
              );
          }
          return Container();
        });
  }
}
