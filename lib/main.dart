// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:bt_frontend/core/constants/screens/landing_screen.dart';
import 'package:bt_frontend/core/constants/screens/loading_screen.dart';
import 'package:bt_frontend/features/auth/providers/establishment_auth.provider.dart';
import 'package:bt_frontend/features/auth/screens/login/login_screen.dart';
import 'package:bt_frontend/features/auth/providers/tourist_auth.provider.dart';
import 'package:bt_frontend/features/auth/screens/signup/establishment/create_account.dart';
import 'package:bt_frontend/features/auth/screens/signup/establishment/upload_picture.dart';
import 'package:bt_frontend/features/auth/screens/signup/establishment/verify_details.dart';
import 'package:bt_frontend/features/auth/screens/signup/select_user_type.dart';
import 'package:bt_frontend/features/auth/screens/signup/tourist/create_account.dart';
import 'package:bt_frontend/features/auth/screens/signup/tourist/upload_picture.dart';
import 'package:bt_frontend/features/auth/screens/signup/tourist/verify_details.dart';
import 'package:bt_frontend/features/establishment/establishment_container.dart';
import 'package:bt_frontend/features/establishment/providers/entry_logs.provider.dart';
import 'package:bt_frontend/features/establishment/providers/est_profile.provider.dart';
import 'package:bt_frontend/features/tourist/providers/complaint.provider.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_hub.provider.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_profile.provider.dart';
import 'package:bt_frontend/features/tourist/tourist_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bot_toast/bot_toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final tokenPresent = await isTokenPresent();
  final userType = await checkUser();

  runApp(MyApp(tokenPresent: tokenPresent, userType: userType));
}

Future<bool> isTokenPresent() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token'); // Replace 'token' with your key

  return token != null && token.isNotEmpty;
}

Future<String> checkUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String user = '';
  int? touristId = prefs.getInt('touristId');
  int? establishmentId = prefs.getInt('establishmentId');

  if (touristId != null) {
    user = 'tourist';
  }

  if (establishmentId != null) {
    user = 'establishment';
  }

  return user;
}

class MyApp extends StatelessWidget {
  final bool tokenPresent;
  final String userType;

  const MyApp({super.key, required this.tokenPresent, required this.userType});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TouristAuthProvider()),
        ChangeNotifierProvider(create: (context) => TouristProfileProvider()),
        ChangeNotifierProvider(create: (context) => TouristHubProvider()),
        ChangeNotifierProvider(create: (context) => ComplaintProvider()),
        ChangeNotifierProvider(create: (context) => EntryLogsProvider()),
        ChangeNotifierProvider(
            create: (context) => EstablishmentAuthProvider()),
        ChangeNotifierProvider(
            create: (context) => EstablishmentProfileProvider()),
      ],
      child: MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          fontFamily: 'ProximaNova',
        ),
        initialRoute: tokenPresent && userType == 'tourist'
            ? '/tourist'
            : tokenPresent && userType == 'establishment'
                ? '/establishment'
                : '/landing',
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
