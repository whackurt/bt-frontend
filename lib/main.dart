// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:bt_frontend/core/constants/screens/landing_screen.dart';
import 'package:bt_frontend/core/constants/screens/loading_screen.dart';
import 'package:bt_frontend/features/auth_features/providers/establishment_auth.provider.dart';
import 'package:bt_frontend/features/auth_features/screens/login/login_screen.dart';
import 'package:bt_frontend/features/auth_features/providers/tourist_auth.provider.dart';
import 'package:bt_frontend/features/auth_features/screens/signup/establishment/create_account.dart';
import 'package:bt_frontend/features/auth_features/screens/signup/establishment/upload_picture.dart';
import 'package:bt_frontend/features/auth_features/screens/signup/establishment/verify_details.dart';
import 'package:bt_frontend/features/auth_features/screens/signup/select_user_type.dart';
import 'package:bt_frontend/features/auth_features/screens/signup/tourist/create_account.dart';
import 'package:bt_frontend/features/auth_features/screens/signup/tourist/upload_picture.dart';
import 'package:bt_frontend/features/auth_features/screens/signup/tourist/verify_details.dart';
import 'package:bt_frontend/features/establishment_features/establishment_container.dart';
import 'package:bt_frontend/features/tourist_features/tourist_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TouristAuthProvider()),
        ChangeNotifierProvider(
            create: (context) => EstablishmentAuthProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'ProximaNova',
        ),
        initialRoute: '/landing',
        // home: const TouristContainer(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/loading':
              return CupertinoPageRoute(
                  builder: (_) => const Loading(), settings: settings);

            case '/landing':
              return CupertinoPageRoute(
                  builder: (_) => const Landing(), settings: settings);

            case '/login':
              return CupertinoPageRoute(
                  builder: (_) => const LoginScreen(), settings: settings);

            case '/signup/select':
              return CupertinoPageRoute(
                  builder: (_) => const SelectUserType(), settings: settings);

            // TOURIST
            case '/signup/tourist/create':
              return CupertinoPageRoute(
                  builder: (_) => const TouristCreateAccount(),
                  settings: settings);

            case '/signup/tourist/uploadPic':
              return CupertinoPageRoute(
                  builder: (_) => const TouristUploadPicture(),
                  settings: settings);

            case '/signup/tourist/verify':
              return CupertinoPageRoute(
                  builder: (_) => const TouristVerifyDetails(),
                  settings: settings);

            case '/tourist':
              return CupertinoPageRoute(
                  builder: (_) => const TouristContainer(), settings: settings);

            // ESTABLISHMENT
            case '/signup/establishment/create':
              return CupertinoPageRoute(
                  builder: (_) => const EstablishmentCreateAccount(),
                  settings: settings);

            case '/signup/establishment/uploadPic':
              return CupertinoPageRoute(
                  builder: (_) => const EstablishmentUploadPicture(),
                  settings: settings);

            case '/signup/establishment/verify':
              return CupertinoPageRoute(
                  builder: (_) => const EstablishmentVerifyDetails(),
                  settings: settings);

            case '/establishment':
              return CupertinoPageRoute(
                  builder: (_) => const EstablishmentContainer(),
                  settings: settings);

            default:
              return CupertinoPageRoute(
                  builder: (_) => const Landing(), settings: settings);
          }
        },
      ),
    );
  }
}
