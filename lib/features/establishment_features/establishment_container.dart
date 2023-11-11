import 'package:bt_frontend/features/establishment_features/home_screen.dart';
import 'package:bt_frontend/features/establishment_features/profile/presentation/screens/establishment_profile.dart';
import 'package:bt_frontend/features/establishment_features/scan_qr/presentation/screens/scan_qr_code.dart';
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
                activeIcon: Icon(Icons.home),
                icon: Icon(
                  Icons.home_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Scan',
                activeIcon: Icon(Icons.qr_code_scanner),
                icon: Icon(
                  Icons.qr_code_scanner_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                activeIcon: Icon(Icons.manage_accounts),
                icon: Icon(
                  Icons.manage_accounts_outlined,
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
