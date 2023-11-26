import 'package:bt_frontend/features/auth/screens/login/login_screen.dart';
import 'package:bt_frontend/features/tourist/features/profile/controllers/tourist_profile.controller.dart';
import 'package:bt_frontend/features/tourist/features/profile/screens/update_profile.dart';
import 'package:bt_frontend/features/tourist/providers/tourist_profile.provider.dart';
import 'package:bt_frontend/widgets/custom_buttons/full_width_btn.dart';
import 'package:bt_frontend/widgets/custom_buttons/red_with_border_btn.dart';
import 'package:bt_frontend/widgets/custom_text/app_text.dart';
import 'package:bt_frontend/widgets/custom_text_field/readonly_text_field.dart';
import 'package:bt_frontend/widgets/wrapper/content_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class BTTouristProfile extends StatefulWidget {
  const BTTouristProfile({super.key});

  @override
  State<BTTouristProfile> createState() => _BTTouristProfileState();
}

class _BTTouristProfileState extends State<BTTouristProfile> {
  AppText appText = AppText();

  bool loading = false;
  Map userProfile = {};

  Future getTouristProfileData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    await TouristProfileController()
        .getTouristProfileData(id: pref.getInt('touristId').toString())
        .then((res) {
      setState(() {
        userProfile = res['data']['data'];
        userProfile['date_of_birth'] = DateFormat.yMMMMd()
            .format(DateTime.parse(res['data']['data']['date_of_birth']));
        context
            .read<TouristProfileProvider>()
            .setTouristData(data: userProfile);
        loading = false;
      });
    });
  }

  void logout(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.clear();

    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    getTouristProfileData();
  }

  @override
  Widget build(BuildContext context) {
    var touristProvider =
        Provider.of<TouristProfileProvider>(context, listen: true);

    return BTContentWrapper(
      onRefresh: () async {
        getTouristProfileData();
      },
      title: 'Profile',
      child: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Column(children: [
              CircleAvatar(
                radius: 75,
                backgroundImage:
                    NetworkImage('${touristProvider.touristData['photo_url']}'),
                backgroundColor: const Color.fromARGB(255, 138, 138, 138),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    BTReadonlyTextField(
                      label: 'First Name',
                      text: '${touristProvider.touristData['first_name']}',
                    ),
                    BTReadonlyTextField(
                      label: 'Last Name',
                      text: '${touristProvider.touristData['last_name']}',
                    ),
                    BTReadonlyTextField(
                      label: 'Gender',
                      text: '${touristProvider.touristData['gender']}',
                    ),
                    BTReadonlyTextField(
                        label: 'Date of Birth',
                        // text: DateFormat.yMMMMd().format(DateTime.parse(
                        //     '${touristProvider.touristData['date_of_birth']} 00:00:00.000'))),
                        text:
                            '${touristProvider.touristData['date_of_birth']}'),
                    BTReadonlyTextField(
                      label: 'Nationality',
                      text: '${touristProvider.touristData['nationality']}',
                    ),
                    BTReadonlyTextField(
                      label: 'Contact Number',
                      text: '${touristProvider.touristData['contact_number']}',
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
                      text: '${touristProvider.touristData['country']}',
                    ),
                    BTReadonlyTextField(
                      label: 'Province',
                      text: '${touristProvider.touristData['state_province']}',
                    ),
                    BTReadonlyTextField(
                      label: 'City/Municipality',
                      text:
                          '${touristProvider.touristData['city_municipality']}',
                    ),
                    BTReadonlyTextField(
                      label: 'Address 1',
                      text: '${touristProvider.touristData['address_1']}',
                    ),
                    BTReadonlyTextField(
                      label: 'Address 2',
                      text: '${touristProvider.touristData['address_2'] ?? ''}',
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
                          content:
                              const Text('Are you sure you want to log out?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
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
              const SizedBox(
                height: 40.0,
              )
            ]),
    );
  }
}
