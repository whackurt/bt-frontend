// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:bt_frontend/core/constants/screens/landing_screen.dart';
import 'package:bt_frontend/core/constants/screens/loading_screen.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/login/login_screen.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/signup/establishment/create_account.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/signup/establishment/upload_picture.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/signup/establishment/verify_details.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/signup/select_user_type.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/signup/tourist/create_account.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/signup/tourist/upload_picture.dart';
import 'package:bt_frontend/features/auth_features/presentation/screens/signup/tourist/verify_details.dart';
import 'package:bt_frontend/features/establishment_features/establishment_container.dart';
import 'package:bt_frontend/features/tourist_features/tourist_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
              builder: (_) => const TouristCreateAccount(), settings: settings);

        case '/signup/tourist/uploadPic':
          return CupertinoPageRoute(
              builder: (_) => const TouristUploadPicture(), settings: settings);

        case '/signup/tourist/verify':
          return CupertinoPageRoute(
              builder: (_) => const TouristVerifyDetails(), settings: settings);

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
  ));
}
