import 'package:bt_frontend/features/tourist_features/profile/screens/update_profile.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BTTouristProfile extends StatefulWidget {
  const BTTouristProfile({super.key});

  @override
  State<BTTouristProfile> createState() => _BTTouristProfileState();
}

class _BTTouristProfileState extends State<BTTouristProfile> {
  AppText appText = AppText();
  String name = 'Kurt Vincent Timajo';

  Map details = {
    'name': 'Lambert Jonard Dela Cruz',
    'sex': 'M',
    'nationality': 'Filipino',
    'birth_date': 'August 12, 1998',
    'email': 'misteryosow@gmail.com',
    'address': {
      "country": "Philippines",
      "province": "Misamis Oriental",
      "city_municipality": "Cagayan de Oro City"
    }
  };
  @override
  Widget build(BuildContext context) {
    return BTContentWrapper(
      title: 'Profile',
      child: Column(children: [
        const CircleAvatar(
          radius: 64,
          backgroundImage: NetworkImage(
              'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'),
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
                label: 'Name',
                text: '${details['name']}',
              ),
              BTReadonlyTextField(
                label: 'Sex',
                text: '${details['sex']}',
              ),
              BTReadonlyTextField(
                label: 'Nationality',
                text: '${details['nationality']}',
              ),
              BTReadonlyTextField(
                label: 'Date of Birth',
                text: '${details['birth_date']}',
              ),
              BTReadonlyTextField(
                label: 'Email Address',
                text: '${details['email']}',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              appText.heading(text: 'Permanent Address'),
              BTReadonlyTextField(
                label: 'Country',
                text: '${details['address']['country']}',
              ),
              BTReadonlyTextField(
                label: 'Provine',
                text: '${details['address']['province']}',
              ),
              BTReadonlyTextField(
                label: 'City/Municipality',
                text: '${details['address']['city_municipality']}',
              ),
            ],
          ),
        ),
        BTFullWidthButton(
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return const BTTouristUpdateProfile();
              },
            ));
          },
          height: 45.0,
          label: 'Update Profile',
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
                          Navigator.of(context).pop(); // Close the alert dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the alert dialog
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
      ]),
    );
  }
}
