import 'package:bt_frontend/features/auth_features/screens/login/login_screen.dart';
import 'package:bt_frontend/features/establishment_features/profile/screens/update_profile.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BTEstProfile extends StatefulWidget {
  const BTEstProfile({super.key});

  @override
  State<BTEstProfile> createState() => _BTEstProfileState();
}

class _BTEstProfileState extends State<BTEstProfile> {
  AppText appText = AppText();
  String name = 'Jonard\'s Grill';

  Map details = {
    'name': 'Jonard\'s grill',
    'type': 'Restaurant',
    'est_contact': '09123456789',
    'est_email': 'misteryosow@gmail.com',
    'est_address': {"brgy": "Baylao", "municipality": "Mambajao"},
    "owner_details": {
      'name': 'Joanrd Lambert Ghini',
      'email': 'themoretheyknow@ustp.edu.ph',
      'phone': '09956299588'
    }
  };

  void logout(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.clear();

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      title: 'Profile',
      child: Column(
        children: [
          const CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(
                'https://cdn.icon-icons.com/icons2/1860/PNG/512/apartment_118092.png'),
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                BTReadonlyTextField(
                  label: 'Establishment Name',
                  text: '${details['name']}',
                ),
                BTReadonlyTextField(
                  label: 'Establishment Type',
                  text: '${details['type']}',
                ),
                BTReadonlyTextField(
                  label: 'Email Address',
                  text: '${details['est_email']}',
                ),
                BTReadonlyTextField(
                  label: 'Contact Number',
                  text: '${details['est_contact']}',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                appText.heading(text: 'Location'),
                BTReadonlyTextField(
                  label: 'Barangay',
                  text: '${details['est_address']['brgy']}',
                ),
                BTReadonlyTextField(
                  label: 'Municipality',
                  text: '${details['est_address']['municipality']}',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                appText.heading(text: 'Owner\'s Information'),
                BTReadonlyTextField(
                  label: 'Name',
                  text: '${details['owner_details']['name']}',
                ),
                BTReadonlyTextField(
                  label: 'Email Address',
                  text: '${details['owner_details']['email']}',
                ),
                BTReadonlyTextField(
                  label: 'Phone Number',
                  text: '${details['owner_details']['phone']}',
                ),
              ],
            ),
          ),
          BTFullWidthButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const BTEstablishmentUpdateProfile();
                },
              ));
            },
            height: 50.0,
            child: const Text(
              'Update Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0),
            ),
          ),
          BTRedBtnWithBorder(
            height: 45.0,
            labelText: 'LOG OUT',
            action: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text(
                        'Log out',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the alert dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            logout(context);
                          },
                          child: const Text(
                            'Log out',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  }));
            },
          ),
        ],
      ),
    );
  }
}
