import 'package:bt_frontend/features/establishment/home_screen.dart';
import 'package:bt_frontend/features/establishment/features/profile/screens/establishment_profile.dart';
import 'package:bt_frontend/features/establishment/features/scan_qr/screens/scan_qr_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                icon: FaIcon(
                  FontAwesomeIcons.house,
                  size: 23.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Scan',
                icon: FaIcon(
                  FontAwesomeIcons.qrcode,
                  size: 23.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: FaIcon(
                  FontAwesomeIcons.userLarge,
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
